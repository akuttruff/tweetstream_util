require './secret.rb'

class Search

  SPLIT = "+_+_+_+_+_+_+"

  def initialize(term, count)
    @term = term
    @count = count

    TweetStream.configure do |config|
    config.consumer_key       = CONSUMER_KEY
    config.consumer_secret    = CONSUMER_SECRET
    config.oauth_token        = OAUTH_TOKEN
    config.oauth_token_secret = OAUTH_TOKEN_SECRET
    config.auth_method        = :oauth
    end
  end
  
  def process
    statuses = []
    
    FileUtils.mkdir_p 'data'
    f = File.open("data/response_data", "w")
    TweetStream::Client.new.track(@term) do |status|  
      f.write(status.to_json)
      f.write(SPLIT)
      statuses << status
      print "."
      break if statuses.size == @count.to_i
    end 
    f.close 
    handles
    tweets
  end

  private

  def handles
    puts 'calling handles'
    data = []
    handles = []
   
    File.read("data/response_data").split(SPLIT).each do |status|
      data << JSON.parse(status)
      data.map do |h| 
        handles << h['user']['screen_name']
      end    
    end
    
    f = File.open("data/handles", "w")
    f.write(handles.uniq.join(',').strip)
    f.close    
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
