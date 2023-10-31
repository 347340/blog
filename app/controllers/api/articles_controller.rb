module Api
  class ArticlesController < ApplicationController

    def index
      articles = Article.select(:id, :title, :content, :created_at).order('created_at desc').page(params[:page] || 1).per(Article.count)
      count = articles.count rescue 0

      render json: {articles: articles, count: count}
    end

    def show
      article = Article.find(params[:id])
      render json: article
    end
  end

  private

  def set_cors_headers
     headers['Access-Control-Allow-Origin'] = '*' # 允许来自任何域的请求，根据需求进行调整
     headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS' # 允许的方法
     headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization' # 允许的请求头部
   end
 end
