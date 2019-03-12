FROM golang as build
ENV CGO_ENABLED=0
RUN go get -u -v github.com/wjdp/htmltest

FROM scratch
COPY --from=build /go/bin/htmltest /bin/
WORKDIR /var/www
ENTRYPOINT [ "/bin/htmltest" ]
