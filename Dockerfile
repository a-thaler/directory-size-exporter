FROM golang:1.20.3 AS build

WORKDIR /src/
COPY main.go go.* /src/
COPY internal/ /src/internal/
RUN CGO_ENABLED=0 go build -o /bin/exporter

FROM scratch
COPY --from=build /bin/exporter /bin/exporter
ENTRYPOINT ["/bin/exporter"]
