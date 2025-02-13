# Use an official Python runtime as the base image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . .

#Run migration
#RUN alembic upgrade head

# Expose the port the app will run on
EXPOSE 7001

# Set the environment variable to allow Uvicorn to listen on all interfaces
ENV UVICORN_CMD="uvicorn main:app --host 0.0.0.0 --port 7001"

# Specify the command to run the FastAPI application with Uvicorn
CMD ["sh", "-c", "$UVICORN_CMD"]