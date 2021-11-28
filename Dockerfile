# STEP 1: Build executable sever and purge binaries with UPX (it is an advanced executable file compressor)
FROM golang:1.17 AS builder
# Add Maintainer Info
LABEL maintainer="Bernardo Secades <bernardosecades@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/github.com/bernardosecades/hello

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
# -ldflags="-w -s" reduce size of bnary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /bin/hello .

# Command to run the executable
ENTRYPOINT ["/bin/hello"]

# STEP 2: Build a small image
FROM alpine:3.13 AS production

COPY --from=builder /bin/hello /go/bin/hello

# Command to run the executable
ENTRYPOINT ["/go/bin/hello"]