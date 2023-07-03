FROM golang:1.16-alpine AS build

WORKDIR /app

COPY . .

RUN go build -ldflags="-s -w" -o main .

FROM scratch

COPY --from=build /app/main /app/main

WORKDIR /app

CMD ["./main"]