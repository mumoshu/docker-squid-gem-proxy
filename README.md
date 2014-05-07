squid-gem-proxy
=====

Run squid as a reverse proxy to http://rubygems.org in a docker container:

    docker pull mumoshu/squid-gem-proxy

    docker run -d -p 49003:80 mumoshu/squid-gem-proxy

It's not specific to squid-gem-proxy, but you need to enable NAT between your host and the vm when Docker is running inside boot2docker:

    VBoxManage controlvm "boot2docker-vm" natpf1 "squid,tcp,127.0.0.1,49003,,49003"

And then time a few http requests through the proxy with something like:

    time gem install BIG-GEM --source http://127.0.0.1:49003

You can also add it to gem's sources:

    gem sources -a http://127.0.0.1:49003

Or even define it in your Gemfile:

    source 'http://127.0.0.1:49003'
