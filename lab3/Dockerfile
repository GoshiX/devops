FROM golang:1.20-alpine AS builder

WORKDIR /app

COPY /src .

RUN pwd
RUN tree

RUN go mod init myapp
RUN go mod tidy

RUN go build -o backend .

RUN rm -rf tmp/

FROM alpine:latest

WORKDIR /app

COPY --from=builder app/backend .

EXPOSE 8000

RUN addgroup -S mygroup && adduser -S myuser -G mygroup && \
    chown -R myuser:mygroup /app

USER myuser

CMD ["./backend"]