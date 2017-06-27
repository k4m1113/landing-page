require 'rest-client'
# require 'pry'

class WritingsController < ApplicationController
  def index
    all = []

    # blogger api call to 'The Irrational Rubyist'
    blogger = RestClient.get 'https://www.googleapis.com/blogger/v3/blogs/5529945907031995637/posts', { params: {
      key: ENV['BLOGGER_API_KEY'],
      fetchBodies: true,
      maxPosts: 15 } }
    # serialize blogger posts
    blogger = JSON.parse(blogger)
    blogger['items'].each do |hash|
      id = DateTime.parse(hash['published']).to_i
      url = hash['url']
      title = hash['title']
      text = hash['content']
      obj = Post.new(id: id, url: url, title: title, text: text)
      all << obj
    end

    # instagram api call to kamillamagna feed
    insta = RestClient.get 'https://api.instagram.com/v1/users/self/media/recent', { params: {
      access_token: ENV['INSTAGRAM_ACCESS_TOKEN'],
      count: 15 } }
    insta = JSON.parse(insta)
    # serialize instagram posts
    insta['data'].each do |hash|
      id = hash['created_time'].to_i
      src = hash['images']['low_resolution']['url']
      url = hash['link']
      cap = hash['caption']['text']
      obj = Gram.new(id: id, src: src, url: url, caption: cap)
      all << obj
    end

    # twitter api call
    $twit = Twitter::REST::Client.new({
      consumer_key: ENV['TWITTER_API_KEY'],
      consumer_secret: ENV['TWITTER_API_SECRET'],
      bearer_token: ENV['TWITTER_BEARER_TOKEN']
    })
    $twit.user_timeline('kamillamagna').each do |tweet|
      id = tweet.created_at.to_i
      url = "http://www.twitter.com/statuses/#{tweet.id}"
      text = tweet.text
      obj = Tweet.new(id: id, url: url, text: text)
      all << obj
    end

    # concatenated blogger, insta, and twitter (tbi) posts, sorted by date created
    @all = all.sort_by!(&:id).reverse!.first(15)
  end
end
