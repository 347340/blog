class Interface::ApiController < ActionController::Base
  def all_article
    all_article = Article.all.map do |article|
      { :id => article.id,
        :title => article.title,
        :content => article.content,
        :created_at => article.created_at,
        :attachment => article.attachment,
      }
    end
    render :json => { :success =>true, :result => all_article}
  end
end
