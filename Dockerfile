# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN mkdir -p /outputs

ENV OUTPUT_DIR="/outputs/"

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run hello_world.py when the container launches
CMD ["python", "main.py"]
