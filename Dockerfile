FROM golang:1.23.2-alpine AS builder

WORKDIR /build
COPY main.go .

RUN go mod init docker-aplicacao-go

RUN go build -o docker-aplicacao-go

FROM alpine:latest AS final
WORKDIR /application
COPY --from=builder /build/docker-aplicacao-go .

CMD [ "./docker-aplicacao-go" ]