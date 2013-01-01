require "rack/jekyll"
run Rack::Jekyll.new
web: bundle exec jekyll --server $PORT
