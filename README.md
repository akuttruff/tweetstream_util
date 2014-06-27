TweetStream_Util
====================

This utility takes a search term and a count and returns the Twitter handles and their tweets as two separate files created in /data/handles and /data/tweets. It uses the streaming [Twitter API](https://dev.twitter.com/docs/api/streaming) and the [Tweetstream](https://github.com/tweetstream/tweetstream) gem.


From the command line:
====================

- clone the directory
- cd to the directory
- from the command line, type: 

  rake stream_for_term['term',7]

where term is a 'string' and count is the number. Be sure not to put a space between the comma and the integer. 
Rake is fussy about passing parameters from the command line!
