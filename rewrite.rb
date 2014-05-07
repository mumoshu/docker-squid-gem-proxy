#!/usr/bin/env ruby
# url rewriter for rubygems squid proxy

STDOUT.sync = true
   
while line = gets
  url = line.split(' ')[0]

  # Cargo-culted this conditional, not sure if it is necessary
  response = if url
    # Need to find a better way to cache this redirect, rather than hard-coding
    # it.
    if url.include?("http://rubygems.org/gems/")
      "302:" + url.gsub(
        "http://rubygems.org/",
        "http://production.cf.rubygems.org/"
      )
    else
      ""
    end
  else
    ""
  end

  puts response
end
