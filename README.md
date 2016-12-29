# Babble

[Live](https://babble-chat.herokuapp.com)

Inspired by Twitch chat but everything is just babble!

## Setup

Dependencies  

- Postgres
- Redis

Clone repo or download zip:

`bundle install`  
`rake db:reset`

In three separate tabs:

`rails server`  
`redis-server /usr/local/etc/redis.conf`  
`bundle exec sidekiq`  
