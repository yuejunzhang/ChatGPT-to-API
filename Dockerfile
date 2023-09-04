
FROM golang:alpine as builder

WORKDIR /app 

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o /app/ChatGPT-To-API .

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/ChatGPT-To-API /app/ChatGPT-To-API 

EXPOSE 8080
CMD [ "/app/ChatGPT-To-API" ]
