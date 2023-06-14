FROM golang:1.18-buster as build

WORKDIR /go/src/grpc-server

COPY . /go/src/grpc-server

RUN go build -o /grpc-server main.go

FROM gcr.io/distroless/base-debian10

COPY --from=build /grpc-server /

EXPOSE 50051

CMD ["/grpc-server"]