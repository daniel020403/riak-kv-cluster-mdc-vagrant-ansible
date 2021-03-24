#!/usr/bin/env bash

dpkg -i /tmp/riak_ee.deb
apt-get install -f

sed -i.bak "s/nodename = riak@127.0.0.1/nodename = $RIAK_NAME@$RIAK_IP/" /etc/riak/riak.conf
rm -v /etc/riak/riak.conf.bak
grep nodename /etc/riak/riak.conf

sed -i.bak "s/listener.http.internal = 127.0.0.1:8098/listener.http.internal = $RIAK_IP:$RIAK_HTTP_PORT/" /etc/riak/riak.conf
rm -v /etc/riak/riak.conf.bak
grep listener.http.internal /etc/riak/riak.conf

sed -i.bak "s/listener.protobuf.internal = 127.0.0.1:8087/listener.protobuf.internal = $RIAK_IP:$RIAK_PB_PORT/" /etc/riak/riak.conf
rm -v /etc/riak/riak.conf.bak
grep listener.protobuf.internal /etc/riak/riak.conf

sed -i.bak "s/distributed_cookie = riak/distributed_cookie = $DISTRIBUTED_COOKIE/" /etc/riak/riak.conf
rm -v /etc/riak/riak.conf.bak
grep distributed_cookie /etc/riak/riak.conf

# sed -i.bak "s/search = off/search = on/" /etc/riak/riak.conf
# rm -v /etc/riak/riak.conf.bak
# grep "search =" /etc/riak/riak.conf

# sed -i.bak "s/search.solr.jvm_options = -d64 -Xms1g -Xmx1g -XX:+UseCompressedOops/search.solr.jvm_options = -d64 -Xms256m -Xmx256m -XX:+UseCompressedOops/" /etc/riak/riak.conf
# rm -v /etc/riak/riak.conf.bak
# grep "jvm_options =" /etc/riak/riak.conf