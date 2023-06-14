# GRPC example for rack v3

> convox rack v3 version must be > 3.12.4
 
### Deploy the service

Create convox app
```
$ convox apps create grpc

```

Deploy the app(make sure you are in this repository)
```
$ convox deploy -a grpc

```

### Test the server
We'll use the [grpcurl](https://github.com/fullstorydev/grpcurl) utility to test

```
$ convox services -a grpc  
SERVICE  DOMAIN                                   PORTS
grpc     grpc.grpc.53536e6397d09f71.convox.cloud  443:50051
```

```
$ grpcurl grpc.grpc.53536e6397d09f71.convox.cloud:443 helloworld.Greeter/SayHello
{
  "message": "Hello "
}
```

```
$ grpcurl -d '{"message": "convox makes life easier"}' grpc.grpc.53536e6397d09f71.convox.cloud:443 grpc.examples.echo.Echo/UnaryEcho
{
  "message": "convox makes life easier"
}
```