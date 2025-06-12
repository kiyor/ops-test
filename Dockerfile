FROM golang:1.24.3 AS builder
WORKDIR /app
COPY go.mod go.mod
COPY index.html index.html
COPY main.go main.go
RUN CGO_ENABLED=0 go build -a -installsuffix cgo -o app .

FROM alpine
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
WORKDIR /root
COPY --from=builder /app/app .
EXPOSE 8080 

ENTRYPOINT ["/root/app"]
