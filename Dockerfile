# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory in the container
RUN mkdir /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN mkdir -p /outputs

ENV OUTPUT_DIR="/outputs/"

ADD main.py /app/main.py

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run hello_world.py when the container launches
CMD ["python", "/app/main.py"]
