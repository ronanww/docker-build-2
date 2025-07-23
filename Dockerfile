# Use a specific, immutable base image
FROM alpine:3.18.6

# Set a fixed build date to ensure consistent metadata
ARG BUILD_DATE=2024-01-01T00:00:00Z
LABEL org.opencontainers.image.created=$BUILD_DATE

# Copy files, ensuring consistent permissions and ownership
# The wildcard '*' often implies an order that can change, so specify files if possible.
# For simplicity here, we assume a single file or a stable directory structure.
# For a truly deterministic copy of multiple files, sort them before adding.
COPY hello.txt /app/hello.txt

# Ensure file permissions and ownership are consistent
RUN chmod 644 /app/hello.txt && \
    chown root:root /app/hello.txt

# Pin package versions (if installing any)
# Example: RUN apk add --no-cache some-package=1.2.3

# Define a fixed entrypoint and command
ENTRYPOINT ["cat"]
CMD ["/app/hello.txt"]
