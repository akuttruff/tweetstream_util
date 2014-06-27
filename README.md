TweetStream_Util
====================

This utility takes a search term (as a 'string') and count (as an integer) and returns the Twitter handles and their tweets as two separate files: /data/handles and /data/tweets. 

It uses the streaming [Twitter API](https://dev.twitter.com/docs/api/streaming) and the [Tweetstream gem](https://github.com/tweetstream/tweetstream).

You must first obtain credentials from [Twitter](https://dev.twitter.com/docs/auth/tokens-devtwittercom). 

    TweetStream.configure do |config|
        config.consumer_key       = CONSUMER_KEY
        config.consumer_secret    = CONSUMER_SECRET
        config.oauth_token        = OAUTH_TOKEN
        config.oauth_token_secret = OAUTH_TOKEN_SECRET
        config.auth_method        = :oauth
    end

Replace each constant with your keys, written as strings.

From the command line:
====================

    git clone https://github.com/akuttruff/tweetstream_util.git
    cd (path/to/directory)/tweetstream_util
    rake stream_for_term['term',7]

where term is a 'string' and count is the number. Be sure not to put a space between the comma and the integer. 
Rake is fussy about passing parameters from the command line!
