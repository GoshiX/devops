FROM system AS build

WORKDIR app/

COPY --from=system app/ .

RUN go build -o backend .