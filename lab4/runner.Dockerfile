FROM alpine:latest

WORKDIR /app

COPY --from=build app/backend .

EXPOSE 8000

RUN addgroup -S mygroup && adduser -S myuser -G mygroup && \
    chown -R myuser:mygroup /app

USER myuser

CMD ["./backend"]