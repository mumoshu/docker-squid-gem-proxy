squid
=====

Run squid as a caching proxy in a docker container:

    docker pull mumoshu/squid-gem-proxy

    docker run -d mumoshu/squid-gem-proxy

And then time a few http requests through the proxy with something like:

    time curl --proxy http://localhost:3128 http://SOME-BIG-FILE
