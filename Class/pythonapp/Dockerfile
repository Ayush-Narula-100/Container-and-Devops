# Use official Python image (Requirement satisfied)
FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Copy application file into container
COPY app.py .

# Install dependency inside container (Requirement satisfied)
RUN pip install numpy

# Run application when container starts
CMD ["python", "app.py"]