require './app.rb'

desc "Returns list of twitter handles and tweets from specified term"
task :streams_for_term, [:term, :count] do |t, args|
  puts "Starts streaming for keyword..."
  term = args[:term]
  count = args[:count]
  util = TweetStreamer.new(term, count)
  util.handles
  util.tweets
  puts "Your files are now ready to view."
end
