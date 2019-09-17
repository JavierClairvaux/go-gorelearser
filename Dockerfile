FROM golang
WORKDIR /
RUN git clone https://github.com/goreleaser/goreleaser
WORKDIR /goreleaser
RUN go get ./...
RUN go build -o goreleaser .
RUN mv goreleaser /usr/local/bin/
WORKDIR /
RUN rm -rf goreleaser/
RUN chmod +x /usr/local/bin/goreleaser
WORKDIR /go
CMD /bin/bash
