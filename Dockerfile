FROM golang:1.23 AS builder
WORKDIR /usr/src/app
COPY . .
RUN go mod download
RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o final

FROM alpine:latest
WORKDIR /app
COPY --from=builder /usr/src/app/final .

CMD ["./final"]