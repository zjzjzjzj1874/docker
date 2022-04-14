#FROM alpine:3.12
FROM alpine:3.12

MAINTAINER zjzjzjzj1874

RUN mkdir -p /go/bin
#RUN make build

WORKDIR /go/bin

COPY web /go/bin/web

ENTRYPOINT ["./web"]