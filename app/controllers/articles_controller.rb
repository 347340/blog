class ArticlesController < ApplicationController

  before_action :get_by_id, only: [:show, :edit, :update, :destroy]

  def index
    # 找到指定的 articles, migration, is_top 默认 false, 修改之后是 true
    @top_articles = Article.where('is_top = ?', true).order('created_at desc')
    # 找到普通的 articles
    @articles = Article.all
    @articles = @articles.where("title like ?", "%#{params[:title]}%") if params[:title].present?
    @articles = @articles.where("content like ?", "%#{params[:content]}%") if params[:content].present?
    @total_count = @articles.size
    @articles = @articles.order('created_at desc').page(params[:page]).per(100)
    # 给未登录的用户，只显示公开的文章
    if session[:current_user].blank?
      @articles = @articles.where('is_shown = ?', false)
    end
    @time = Time.now.in_time_zone.strftime("%H:%M:%S")
  end

  def new
    #if session[:current_user].blank?
    #  redirect_to '/articles' and return
    #end

    @article = Article.new
  end


  def create
    #if session[:current_user].blank?
    #  redirect_to '/articles' and return
    #end

    @article = Article.new
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.is_top = params[:article][:is_top]
    @article.is_shown = params[:article][:is_shown]

    if params[:article] && params[:article][:attachment].present?
      attachment_io = params[:article][:attachment]

      file_name = Rails.root.join('public', 'images', attachment_io.original_filename)
      File.open(file_name, 'wb') do |file|
        #file.write(attachment_io.read)
        file.write(attachment_io.read.force_encoding('UTF-8'))
      end
      @article.attachment = '/images/' + attachment_io.original_filename
      @article.save
      redirect_to articles_path
    else
      @article.save
      redirect_to articles_path
    end
  end

  def show
    @comments = Comment.where('article_id = ?', params[:id]).all
    @comments = @comments.order('created_at desc')
  end

  def edit
    #if session[:current_user].blank?
    #  redirect_to '/articles' and return
    #end

    @article = Article.find(params[:id])
  end

  def update
    #if session[:current_user].blank?
    #  redirect_to '/articles' and return
    #end

    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.is_top = params[:article][:is_top]
    @article.is_shown = params[:article][:is_shown]

    if params[:article] && params[:article][:attachment].present?
      attachment_io = params[:article][:attachment]

      file_name = Rails.root.join('public', 'images', attachment_io.original_filename)
      File.open(file_name, 'wb') do |file|
        file.write(attachment_io.read)
      end
      @article.attachment = '/images/' + attachment_io.original_filename
      @article.save
      redirect_to articles_path
    else
      @article.save
      redirect_to articles_path
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    def get_by_id
      @article = Article.find(params[:id])
    end

  def article_params
    params.require(:article).permit(:title, :content, :category_id, :is_top, :is_shown)
  end

end
