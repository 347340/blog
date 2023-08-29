ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'production'
require File.expand_path(File.dirname(__FILE__) + '/../config/environment')
require 'rails'
require 'rubygems'
require 'json'

urls = %w{
https://blog.csdn.net/Toml_/article/details/132166559
https://blog.csdn.net/Toml_/article/details/132166559
https://blog.csdn.net/Toml_/article/details/132163753
https://blog.csdn.net/Toml_/article/details/132149542
https://blog.csdn.net/Toml_/article/details/132147017
https://blog.csdn.net/Toml_/article/details/132146510
https://blog.csdn.net/Toml_/article/details/132116152
https://blog.csdn.net/Toml_/article/details/132109552
https://blog.csdn.net/Toml_/article/details/132108348
https://blog.csdn.net/Toml_/article/details/132098593
https://blog.csdn.net/Toml_/article/details/132097776
https://blog.csdn.net/Toml_/article/details/132072268
https://blog.csdn.net/Toml_/article/details/132064108
https://blog.csdn.net/Toml_/article/details/132063452
https://blog.csdn.net/Toml_/article/details/131975701
https://blog.csdn.net/Toml_/article/details/131953126
https://blog.csdn.net/Toml_/article/details/131952795
https://blog.csdn.net/Toml_/article/details/131952417
https://blog.csdn.net/Toml_/article/details/131823995
https://blog.csdn.net/Toml_/article/details/131902448
https://blog.csdn.net/Toml_/article/details/131901899
https://blog.csdn.net/Toml_/article/details/131900627
https://blog.csdn.net/Toml_/article/details/131900627
https://blog.csdn.net/Toml_/article/details/131844310
https://blog.csdn.net/Toml_/article/details/131841594
https://blog.csdn.net/Toml_/article/details/131841543
https://blog.csdn.net/Toml_/article/details/131841468
https://blog.csdn.net/Toml_/article/details/131841337
https://blog.csdn.net/Toml_/article/details/131838239
https://blog.csdn.net/Toml_/article/details/131837735
https://blog.csdn.net/Toml_/article/details/131835802
https://blog.csdn.net/Toml_/article/details/131832000
https://blog.csdn.net/Toml_/article/details/131825607
https://blog.csdn.net/Toml_/article/details/131823720
https://blog.csdn.net/Toml_/article/details/131822106
https://blog.csdn.net/Toml_/article/details/131815984
https://blog.csdn.net/Toml_/article/details/131815902
https://blog.csdn.net/Toml_/article/details/131815876
https://blog.csdn.net/Toml_/article/details/131815775
https://blog.csdn.net/Toml_/article/details/131815265
https://blog.csdn.net/Toml_/article/details/131805562
https://blog.csdn.net/Toml_/article/details/131804873
https://blog.csdn.net/Toml_/article/details/131790862
https://blog.csdn.net/Toml_/article/details/131790862
https://blog.csdn.net/Toml_/article/details/131782424
https://blog.csdn.net/Toml_/article/details/131697630
https://blog.csdn.net/Toml_/article/details/131653449
https://blog.csdn.net/Toml_/article/details/131653176
https://blog.csdn.net/Toml_/article/details/131591165
https://blog.csdn.net/Toml_/article/details/131632790
https://blog.csdn.net/Toml_/article/details/131589872
https://blog.csdn.net/Toml_/article/details/131568015
https://blog.csdn.net/Toml_/article/details/131559413
https://blog.csdn.net/Toml_/article/details/131505095
https://blog.csdn.net/Toml_/article/details/131479140
https://blog.csdn.net/Toml_/article/details/131479077
https://blog.csdn.net/Toml_/article/details/131477664
https://blog.csdn.net/Toml_/article/details/131464544
https://blog.csdn.net/Toml_/article/details/131449517
https://blog.csdn.net/Toml_/article/details/131448604
https://blog.csdn.net/Toml_/article/details/131448569
https://blog.csdn.net/Toml_/article/details/131448557
https://blog.csdn.net/Toml_/article/details/131446593
https://blog.csdn.net/Toml_/article/details/131446399
https://blog.csdn.net/Toml_/article/details/131446399
https://blog.csdn.net/Toml_/article/details/131446343
https://blog.csdn.net/Toml_/article/details/131220642
https://blog.csdn.net/Toml_/article/details/131192093
https://blog.csdn.net/Toml_/article/details/131192034
https://blog.csdn.net/Toml_/article/details/131134047
https://blog.csdn.net/Toml_/article/details/131132731
https://blog.csdn.net/Toml_/article/details/131132403
https://blog.csdn.net/Toml_/article/details/131130284
https://blog.csdn.net/Toml_/article/details/131127035
https://blog.csdn.net/Toml_/article/details/131122113
https://blog.csdn.net/Toml_/article/details/131120401
https://blog.csdn.net/Toml_/article/details/131120096
https://blog.csdn.net/Toml_/article/details/131113997
https://blog.csdn.net/Toml_/article/details/131110054
https://blog.csdn.net/Toml_/article/details/131101227
https://blog.csdn.net/Toml_/article/details/131100647
https://blog.csdn.net/Toml_/article/details/131100476
https://blog.csdn.net/Toml_/article/details/131100367
https://blog.csdn.net/Toml_/article/details/131081427
https://blog.csdn.net/Toml_/article/details/131048785
https://blog.csdn.net/Toml_/article/details/131048785
https://blog.csdn.net/Toml_/article/details/131048530
https://blog.csdn.net/Toml_/article/details/131029106
https://blog.csdn.net/Toml_/article/details/131028985
https://blog.csdn.net/Toml_/article/details/131028914
https://blog.csdn.net/Toml_/article/details/130972515
https://blog.csdn.net/Toml_/article/details/130931524
https://blog.csdn.net/Toml_/article/details/130931320
https://blog.csdn.net/Toml_/article/details/130886225
https://blog.csdn.net/Toml_/article/details/130881644
https://blog.csdn.net/Toml_/article/details/130881482
https://blog.csdn.net/Toml_/article/details/130843964
https://blog.csdn.net/Toml_/article/details/130832963
https://blog.csdn.net/Toml_/article/details/130832854
https://blog.csdn.net/Toml_/article/details/130832724
https://blog.csdn.net/Toml_/article/details/130831910
https://blog.csdn.net/Toml_/article/details/130830134
https://blog.csdn.net/Toml_/article/details/130829646
https://blog.csdn.net/Toml_/article/details/130828265
https://blog.csdn.net/Toml_/article/details/130820694
https://blog.csdn.net/Toml_/article/details/130820617
https://blog.csdn.net/Toml_/article/details/130820617
https://blog.csdn.net/Toml_/article/details/130820381
https://blog.csdn.net/Toml_/article/details/130748099
https://blog.csdn.net/Toml_/article/details/130747706
https://blog.csdn.net/Toml_/article/details/130742831
https://blog.csdn.net/Toml_/article/details/130742366
https://blog.csdn.net/Toml_/article/details/130741021
https://blog.csdn.net/Toml_/article/details/130727629
https://blog.csdn.net/Toml_/article/details/130725917
https://blog.csdn.net/Toml_/article/details/130559580
https://blog.csdn.net/Toml_/article/details/130507152
https://blog.csdn.net/Toml_/article/details/130507125
https://blog.csdn.net/Toml_/article/details/130507068
https://blog.csdn.net/Toml_/article/details/130504023
https://blog.csdn.net/Toml_/article/details/130503388
https://blog.csdn.net/Toml_/article/details/130501939
https://blog.csdn.net/Toml_/article/details/130500464
https://blog.csdn.net/Toml_/article/details/130495776
https://blog.csdn.net/Toml_/article/details/130495330
https://blog.csdn.net/Toml_/article/details/130466264
https://blog.csdn.net/Toml_/article/details/130466101
https://blog.csdn.net/Toml_/article/details/130466101
https://blog.csdn.net/Toml_/article/details/130465893
https://blog.csdn.net/Toml_/article/details/130465757
https://blog.csdn.net/Toml_/article/details/130465797
https://blog.csdn.net/Toml_/article/details/130415213
https://blog.csdn.net/Toml_/article/details/130373889
https://blog.csdn.net/Toml_/article/details/130368341
https://blog.csdn.net/Toml_/article/details/130308604
https://blog.csdn.net/Toml_/article/details/130357389
https://blog.csdn.net/Toml_/article/details/130284802
https://blog.csdn.net/Toml_/article/details/130283645
https://blog.csdn.net/Toml_/article/details/130281905
https://blog.csdn.net/Toml_/article/details/130259986
https://blog.csdn.net/Toml_/article/details/130238676
https://blog.csdn.net/Toml_/article/details/130237890
https://blog.csdn.net/Toml_/article/details/130223812
https://blog.csdn.net/Toml_/article/details/130216964
https://blog.csdn.net/Toml_/article/details/130216129
https://blog.csdn.net/Toml_/article/details/130214744
https://blog.csdn.net/Toml_/article/details/130205913
https://blog.csdn.net/Toml_/article/details/130168155
https://blog.csdn.net/Toml_/article/details/130168155
https://blog.csdn.net/Toml_/article/details/130167978
https://blog.csdn.net/Toml_/article/details/130167873
https://blog.csdn.net/Toml_/article/details/130137079
https://blog.csdn.net/Toml_/article/details/130137001
https://blog.csdn.net/Toml_/article/details/130111959
https://blog.csdn.net/Toml_/article/details/130085214
https://blog.csdn.net/Toml_/article/details/130084968
https://blog.csdn.net/Toml_/article/details/130060801
https://blog.csdn.net/Toml_/article/details/130060577
https://blog.csdn.net/Toml_/article/details/130054965
https://blog.csdn.net/Toml_/article/details/130053870
https://blog.csdn.net/Toml_/article/details/130052268
https://blog.csdn.net/Toml_/article/details/130008242
https://blog.csdn.net/Toml_/article/details/130005808
https://blog.csdn.net/Toml_/article/details/130005000
https://blog.csdn.net/Toml_/article/details/129989664
https://blog.csdn.net/Toml_/article/details/129955563
https://blog.csdn.net/Toml_/article/details/129955317
https://blog.csdn.net/Toml_/article/details/129955037
https://blog.csdn.net/Toml_/article/details/129946389
https://blog.csdn.net/Toml_/article/details/129946389
https://blog.csdn.net/Toml_/article/details/129903274
https://blog.csdn.net/Toml_/article/details/129903110
https://blog.csdn.net/Toml_/article/details/129884150
https://blog.csdn.net/Toml_/article/details/129862699
https://blog.csdn.net/Toml_/article/details/129841871
https://blog.csdn.net/Toml_/article/details/129836477
https://blog.csdn.net/Toml_/article/details/129835949
https://blog.csdn.net/Toml_/article/details/129817467
https://blog.csdn.net/Toml_/article/details/129799464
https://blog.csdn.net/Toml_/article/details/129796771
https://blog.csdn.net/Toml_/article/details/129745010
https://blog.csdn.net/Toml_/article/details/129735622
https://blog.csdn.net/Toml_/article/details/129734071
https://blog.csdn.net/Toml_/article/details/129728053
https://blog.csdn.net/Toml_/article/details/129715478
https://blog.csdn.net/Toml_/article/details/129712108
https://blog.csdn.net/Toml_/article/details/129706689
https://blog.csdn.net/Toml_/article/details/129690801
https://blog.csdn.net/Toml_/article/details/129688005
https://blog.csdn.net/Toml_/article/details/129684212
https://blog.csdn.net/Toml_/article/details/129684212
https://blog.csdn.net/Toml_/article/details/129669533
https://blog.csdn.net/Toml_/article/details/129669252
https://blog.csdn.net/Toml_/article/details/129664674
https://blog.csdn.net/Toml_/article/details/129625051
https://blog.csdn.net/Toml_/article/details/129616969
https://blog.csdn.net/Toml_/article/details/129614021
https://blog.csdn.net/Toml_/article/details/129611791
https://blog.csdn.net/Toml_/article/details/129593644
https://blog.csdn.net/Toml_/article/details/129580302
https://blog.csdn.net/Toml_/article/details/129555267
https://blog.csdn.net/Toml_/article/details/129555075
https://blog.csdn.net/Toml_/article/details/129546767
https://blog.csdn.net/Toml_/article/details/129533338
https://blog.csdn.net/Toml_/article/details/129501383
https://blog.csdn.net/Toml_/article/details/129501215
https://blog.csdn.net/Toml_/article/details/129493367
https://blog.csdn.net/Toml_/article/details/129453311
https://blog.csdn.net/Toml_/article/details/129452741
https://blog.csdn.net/Toml_/article/details/129452439
https://blog.csdn.net/Toml_/article/details/129428577
https://blog.csdn.net/Toml_/article/details/129428577
https://blog.csdn.net/Toml_/article/details/129424025
https://blog.csdn.net/Toml_/article/details/129409240
https://blog.csdn.net/Toml_/article/details/129409086
https://blog.csdn.net/Toml_/article/details/129397444
https://blog.csdn.net/Toml_/article/details/129367653
https://blog.csdn.net/Toml_/article/details/129367266
https://blog.csdn.net/Toml_/article/details/129358225
https://blog.csdn.net/Toml_/article/details/129354836
https://blog.csdn.net/Toml_/article/details/129352840
https://blog.csdn.net/Toml_/article/details/129340525
https://blog.csdn.net/Toml_/article/details/129340392
https://blog.csdn.net/Toml_/article/details/129340216
https://blog.csdn.net/Toml_/article/details/129324727
https://blog.csdn.net/Toml_/article/details/129309931
https://blog.csdn.net/Toml_/article/details/129309744
https://blog.csdn.net/Toml_/article/details/129309611
https://blog.csdn.net/Toml_/article/details/129308791
https://blog.csdn.net/Toml_/article/details/129235631
https://blog.csdn.net/Toml_/article/details/129205950
https://blog.csdn.net/Toml_/article/details/129205413
https://blog.csdn.net/Toml_/article/details/129205413
https://blog.csdn.net/Toml_/article/details/129202983
https://blog.csdn.net/Toml_/article/details/129147738
https://blog.csdn.net/Toml_/article/details/129063505
https://blog.csdn.net/Toml_/article/details/129028399
https://blog.csdn.net/Toml_/article/details/129014298
https://blog.csdn.net/Toml_/article/details/128986405
https://blog.csdn.net/Toml_/article/details/128981599
https://blog.csdn.net/Toml_/article/details/128980653
https://blog.csdn.net/Toml_/article/details/128980412
https://blog.csdn.net/Toml_/article/details/128956574
https://blog.csdn.net/Toml_/article/details/128931971
https://blog.csdn.net/Toml_/article/details/128931792
}

def get_post_body(url)
  request = HTTParty.get(url)
  parsed_body = Nokogiri::HTML(request.body)

  title = parsed_body.css('#articleContentId').first.content
  puts "== title: #{title}"
  created_at = parsed_body.css('.time').first.content.gsub('已于', '').gsub('修改', '').strip
  puts "== 时间: #{created_at}"
  article_body = parsed_body.css('#content_views')
  puts "== 内容: #{article_body}"

  # 检查数据库中是否已存在具有相同标题的文章
  if Article.exists?(title: title)
    puts "文章已存在，跳过保存"
  else
    Article.create!(title: title, content: article_body, created_at: created_at)
    puts "保存文章成功"
  end
end

urls.each do |url|
  get_post_body(url)
end

#get_post_body "https://blog.csdn.net/Toml_/article/details/132163753"
