FROM tianon/centos:6.5
MAINTAINER ykuoka@gmail.com

# We also need Ruby for running squid's `url_rewrite_program` which is, in this configuration, written in Ruby.
RUN yum install -y squid ruby

# This also adds the "squid" user and group
ADD squid.conf /etc/squid/squid.conf

ADD rewrite.rb /etc/squid/rewrite.rb

# This is executed by squid's redirectors
# so we must make it executable or squid's redirectors will end up exiting rapidly.
RUN chmod +x /etc/squid/rewrite.rb

# Prepare dirs required by squid
RUN mkdir -p /usr/local/var/cache/squid
RUN chown -R squid:squid /usr/local/var/cache/squid
RUN mkdir -p /var/log/squid
RUN chown -R squid:squid /var/log/squid

# Make cache dirs 
RUN squid -z -F

EXPOSE 3128

# -X verbose debug logging
# -N Don't run in daemon mode - important for docker
ENTRYPOINT ["squid", "-N", "-X"]
