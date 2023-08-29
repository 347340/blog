class CommentUsersController < ApplicationController
  def new
    @comment_user = CommentUser.new
  end

  def create
    @comment_user = CommentUser.new(comment_user_params)
    @comment_user.username = params[:comment_user][:username]
    @comment_user.password = params[:comment_user][:password]
    @comment_user.save

    if @comment_user.username.blank? || @comment_user.password.blank?
      redirect_to :back, notice: '用户名和密码不能为空'
      return
    end

    session[:current_comment_user] = @comment_user
    redirect_to article_path(params[:article_id])
  end

  def logout
    session[:current_comment_user] = nil
    session[:is_comment_user_username] = '尚未登录'

    redirect_to article_path(params[:article_id])
  end

  private

  def comment_user_params
    params.require(:comment_user).permit(:username, :password)
  end
end
