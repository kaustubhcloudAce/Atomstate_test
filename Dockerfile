# Use the official Rust image as the base
FROM rust:latest AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Rust project files to the working directory
COPY . .

# Build the Rust project
RUN cargo build --release

# Create a minimal runtime image with just the compiled binary
FROM debian:buster-slim

# Set the working directory inside the runtime container
WORKDIR /app

# Copy the compiled binary from the builder stage
COPY --from=builder /app/target/release/file_reader .

# Set the binary as the entrypoint
ENTRYPOINT ["./file_reader"]

# Expose a port if your application listens on one
# Example:
# EXPOSE 8080
