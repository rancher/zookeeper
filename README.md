## Zookeeper Container

----
This container runs a stock zookeeper 3.6 instance.

It leverages confd to populate the config files. Given the way Zookeeper 
To use the container it is initialized via like so:

```
 docker run -d --net=host --name=zookeeper \
 -e SERVICES_ZOOKEEPER_MYID=<int> \
 -e SERVICES_ZOOKEEPER_HOST_1='{"Id": "1", "Ip": "<ip>"}' \
 -e SERVICES_ZOOKEEPER_HOST_2='{"Id": "<n>", "Ip": "<ip>"}' \
 rancher/zookeeer 
```

The container will setup ports on 2181,2888,3888 on the host.

Each node in the zookeeper cluster will need an entry, and the ID/IP pairs must be the same for all hosts.

The `network = host` so that ZK can bind to the instances IP.

## Contact
For bugs, questions, comments, corrections, suggestions, etc., open an issue in
 [rancher/rancher](//github.com/rancher/rancher/issues) with a title starting with `[go-machine-service] `.

Or just [click here](//github.com/rancher/rancher/issues/new?title=%5Bgo-machine-service%5D%20) to create a new issue.
