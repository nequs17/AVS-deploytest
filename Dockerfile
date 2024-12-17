FROM golang:1.21 as builder

ENV CGO_ENABLED=1 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /app

COPY main.go ./

RUN go build -o app main.go

FROM debian:bullseye-slim

COPY --from=builder /app/app /usr/local/bin/app

RUN apt-get update && apt-get install -y libc6 && rm -rf /var/lib/apt/lists/*

CMD ["app"]