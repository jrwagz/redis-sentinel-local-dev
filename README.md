# Docker Compose Setup for Local Redis w/ Sentinel

This creates a local dev environment with a redis master and redis sentinel. DO NOT USE this setup
for production as it is NOT really HA, but it adheres to the same API that a real HA redis
sentinel setup would.

Launch the setup with:

```text
docker-compose up -d
```

And you can connect to the redis sentinel on 127.0.0.1:26379

```text
$ redis-cli -p 26379 -h 127.0.0.1
127.0.0.1:26379> SENTINEL get-master-addr-by-name mymaster
1) "127.0.0.1"
2) "6379"
127.0.0.1:26379>
```

## Configuration

There is only one variable you can control with this setup, and it is set in the `./.env` file.

- `REDIS_MASTER_SET`: Name of the set of Redis(R) instances to monitor. Default: mymaster
