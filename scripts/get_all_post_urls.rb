ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'production'
require File.expand_path(File.dirname(__FILE__) + '/../config/environment')
require 'rails'
require 'rubygems'
require 'json'

def get_single_page_urls page
  puts "=== in page: #{page}"
  url = "https://blog.csdn.net/community/home-api/v1/get-business-list?page=#{page}&size=20&businessType=lately&noMore=false&username=Toml_"
  response = HTTParty.get(url)
  #puts response.body, response.code, response.message, response.headers.inspect

  my_body = JSON.parse response.body
  puts my_body['data']['list'][0]['url']
  my_body['data']['list'].each do |element|
    puts element['url']
  end
end


(1..12).each do |page|
  get_single_page_urls page
end


