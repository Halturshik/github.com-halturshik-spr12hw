FROM golang:1.23
WORKDIR /usr/src/app
COPY . .
RUN go mod download
RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o final
CMD ["./final"]