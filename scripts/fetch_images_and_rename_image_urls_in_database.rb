ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'production'
require File.expand_path(File.dirname(__FILE__) + '/../config/environment')
require 'rails'
require 'rubygems'
require 'json'


# 仅处理一个article
def fetch_image_and_rename_image_urls article

  puts "== processing: id: #{article.id}, title: #{article.title}"

  regexp = /https:\/\/img-blog\.csdnimg\.cn\/\w+.png/
  # 1. 获得某个article content中的所有图片
  article.content.scan(regexp).each do |url|
    puts url
    file_name = url.split('/').last

    # 2. 把这些图片都抓取到本地，并重新命名
    # https://img-blog.csdnimg.cn/13e29d1a43ac400798958fdacdf58028.png
    #
    command = "wget #{url} -O public/images/#{file_name}"
    `#{command}`

    # 3. 把content中的老图片的URL， 替换成新图片的URL
    # https://img-blog.csdnimg.cn/f660c00d6be44f48b42b4e8def9b2aca.png
    # https://img-blog.csdnimg.cn/f660c00d6be44f48b42b4e8def9b2aca.png => /images/f660c00d6be44f48b42b4e8def9b2aca.png
    # 也就是说. https://img-blog.csdnimg.cn/ => /images
  end

  article.content = article.content.gsub("https://img-blog.csdnimg.cn", "/images")
  article.save!
end

# 处理所有
Article.all.each do |article|
  fetch_image_and_rename_image_urls article
end

#fetch_image_and_rename_image_urls Article.find(621)
