TweetStream_Util 
====================

TweetStream_Util uses the streaming [Twitter API](https://dev.twitter.com/docs/api/streaming) and the [Tweetstream gem](https://github.com/tweetstream/tweetstream). It takes a search term (as a 'string') and count (as an integer) and returns the user handles and tweets from Twitter's live feed. Find out who's currently discussing whatever topic you'd like to explore.

The return data is saved as two separate files: /data/handles and /data/tweets 


You must first [obtain credentials](https://dev.twitter.com/docs/auth/tokens-devtwittercom) from Twitter. 

    TweetStream.configure do |config|
        config.consumer_key       = CONSUMER_KEY
        config.consumer_secret    = CONSUMER_SECRET
        config.oauth_token        = OAUTH_TOKEN
        config.oauth_token_secret = OAUTH_TOKEN_SECRET
        config.auth_method        = :oauth
    end

Replace each constant with your own application keys, written as strings.

From the command line:
====================

    git clone https://github.com/akuttruff/tweetstream_util.git
    cd (path/to/directory)/tweetstream_util
    rake stream_for_term['term',7]

where term is a 'string' and count is the number. Be sure not to put a space between the comma and the integer. 
Rake is fussy about passing parameters from the command line!
