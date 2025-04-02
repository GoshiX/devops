FROM golang:1.20-alpine AS builder

WORKDIR /app

COPY /src .

RUN go mod init myapp
RUN go mod tidy