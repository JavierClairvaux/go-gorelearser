FROM golang:1.12.9-alpine3.9
WORKDIR /root
RUN apk add git
RUN git clone https://github.com/goreleaser/goreleaser
WORKDIR /root/goreleaser
RUN go get ./... && \
 go build -o goreleaser . && \
 mv goreleaser /usr/local/bin/
WORKDIR /root
RUN rm -rf goreleaser/&& \
  chmod +x /usr/local/bin/goreleaser
RUN apk --no-cache --update add bash curl less groff jq python py-pip && \
  pip install --no-cache-dir --upgrade pip && \
  pip install --no-cache-dir awscli==1.16.240 && \
  mkdir /root/.aws && \
  aws --version
RUN apk add --update coreutils bash && rm -rf /var/cache/apk/*
COPY aws-cleaner.sh /scrypt/
RUN chmod +x /scrypt/aws-cleaner.sh
WORKDIR /go
CMD /bin/ash
