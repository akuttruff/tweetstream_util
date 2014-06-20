require 'tweetstream'
require 'json'
require 'fileutils'
require 'pry'

class TweetStreamUtil

  SPLIT = "+_+_+_+_+_+_+"

  def initialize(term, count)

    TweetStream.configure do |config|
    config.consumer_key       = 'Wy8N1vjSQVeZOBqxx77W656HF'
    config.consumer_secret    = '6cC74aEScQ5MwoCPh3q5F9Dd9JZLOm8Aa9rKAX9jCo47CR5wqT'
    config.oauth_token        = '1335425287-qoCQu3iuw4PkQ1AoMa6F3EXnDnCLyTRUCKFiO3q'
    config.oauth_token_secret = '8Q00y92ZCtjCM3rinVKIMxGwkXahUDGsCrLYTNhDHZYZt'
    config.auth_method        = :oauth
    end

    statuses = []

    FileUtils.mkdir_p 'data'
    f = File.open("data/response_data", "w")
    binding.pry
    TweetStream::Client.new.track(term) do |status|
      f.write(status.attrs.to_json)
      f.write(SPLIT)
      p status.inspect
      statuses << status
      print "."
      break if statuses.size == count.to_i
    end
    f.close
  end

  def handles
    data = []
    handles = []

    File.read("data/response_data").split(SPLIT).each do |status|
      data << JSON.parse(status)
      data.map do |h|
        handles << h['user']['screen_name']
    end
      f = File.open("data/handles", "w")
      f.write(handles)
      f.close
    end
  end

  def tweets
    data = []
    tweets = []

    File.read("data/response_data").split(SPLIT).each do |status|
      data << JSON.parse(status)
      data.map do |h|
        tweets << h['text']
      end
    end
      f = File.open("data/tweets", "w")
      f.write(tweets)
      f.close
  end
end
