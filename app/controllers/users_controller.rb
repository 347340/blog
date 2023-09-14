require_relative '../mailers/user_mailer'
class UsersController < ApplicationController
  def show_login_page
  end

  def show_profile
    if session[:current_user].blank?
      redirect_to '/articles' and return
    end
    @user = User.find session[:current_user]['id']
  end

  def edit_profile
    if session[:current_user].blank?
      redirect_to '/articles' and return
    end
  end

  def save_profile
    if session[:current_user].blank?
      redirect_to '/articles' and return
    end

    uploaded_io = params[:avatar_image]
    file_name = Rails.root.join('public', 'images', uploaded_io.original_filename)
    File.open(file_name, 'wb') do |file|
      file.write(uploaded_io.read)
    end

    user = User.find session[:current_user]['id']
    user.avatar_path = '/images/' +  uploaded_io.original_filename
    user.save!

    redirect_to '/users/show_profile'
  end

  def login
    login = params[:login]
    password = params[:password]

    user = User.where('login = ?', login).last
    # 如果用户存在
    if user.present?

      # 判断密码是否正确
      if user.password == password

        # 当前用户是正确登录的
        session[:current_user] = user
        session[:is_user_login] = '管理员登录了!'

        Rails.logger.info "=== '登录成功'"
        # 在管理登录之后发送一封通知邮件
        #Rails.logger.info "==========-------- #{user.inspect}"
        #UserMailer.welcome_email(user).deliver_now!
        redirect_to '/articles' and return
      else
        Rails.logger.info "=== 用户名对，密码不对"
      end
    else
      Rails.logger.info "=== '用户名不对'"
    end

   Rails.logger.info "=== '用户名与密码不匹配'"
   redirect_to :back, notice: '用户名与密码不匹配'
  end

  def logout
    session[:current_user] = nil
    session[:is_user_login] = '尚未登录'

    Rails.logger.info "=== '退出成功'"
    redirect_to '/articles'
  end
end
