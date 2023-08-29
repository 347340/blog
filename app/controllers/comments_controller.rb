class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @comments = Comment.joins(:comment_user).where("comment_users.username LIKE ?", "%#{params[:username]}%") if params[:username].present?
    @total_count = @comments.size
    @comments = @comments.order('created_at desc').page(params[:page]).per(15)
  end

  def create
    comment = Comment.new
    comment.article_id = params[:article_id]
    comment.author_name = params[:author_name]
    comment.content = params[:content]
    comment.comment_user_id = session[:current_comment_user]['id']
    comment.save!
   if comment.save
      # 发送邮件通知任务成员
      UserMailer.welcome_email(comment).deliver_now
    end

    #redirect_to :back
    redirect_to "/articles/#{params[:article_id]}"
  end

end
