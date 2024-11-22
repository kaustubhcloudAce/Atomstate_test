# Use Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy application code
COPY app/ .

# Install dependencies
RUN pip install flask

# Expose port
EXPOSE 8080

# Run the application
CMD ["python", "main.py"]