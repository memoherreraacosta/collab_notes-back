FROM golang

WORKDIR /go/src/app

COPY . .

RUN go get ./...

RUN go build hello.go

CMD ./hello

