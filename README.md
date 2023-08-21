# Docker Compose Setup for Local Redis w/ Sentinel

This creates a local dev environment with a redis master and redis sentinel. DO NOT USE this setup
for production as it is NOT really HA, but it adheres to the same API that a real HA redis
sentinel setup would.

In order to make this work on Docker Desktop for Mac (and presumably Windows/WSL as well) we had to
play some tricks to get the right IP addresses to configure all the parts of the system.  For
details, see the post at <https://xavierchow.github.io/2019/03/06/docker-redis-sentinel/> which I
leveraged heavily.

Launch the setup with:

```text
./start_me.sh
```

And you can connect to the redis sentinel on 127.0.0.1:26379

```text
$ redis-cli -p 26379 -h 127.0.0.1
127.0.0.1:26379> SENTINEL get-master-addr-by-name mymaster
1) "192.168.1.70"
2) "6379"
127.0.0.1:26379>
```

Note, the IP address that it returns for the master should match the value of `DOCKER_HOST_IP` as
determined in `./start_me.sh`

## Configuration

The following configs are set in the `./.env` file.

- `REDIS_MASTER_SET`: Name of the set of Redis(R) instances to monitor. Default: mymaster
- `DOCKER_HOST_IP`: IP address of local machine that is reachable from within docker and on the host
  - this should be automatically set by `./start_me.sh`
