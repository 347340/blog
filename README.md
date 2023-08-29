# blog

需要的rails环境<br/>
---

    rails -v
    Rails 4.2.11.3

需要的ruby环境<br/>
---

    ruby -v
    ruby 2.6.9

启动<br/>
---
创建数据库<br/>

    bundle exec rake db:create
创建表，然后运行这个表<br/>

    bundle exec rake db:migrate
启动服务器（默认在300端口）<br/>

    bundle exec rails server
