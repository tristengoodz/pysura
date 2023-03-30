# Python image to use.
FROM python:3.10
ENV PYTHONUNBUFFERED 1
# Set the working directory to /app
WORKDIR /app
# copy the requirements file used for dependencies
COPY requirements.txt .
# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copy the rest of the working directory contents into the container at /app
COPY . .

# Run app.py when the container launches
CMD exec gunicorn --timeout 600 --bind :$PORT --workers 1 --worker-class uvicorn.workers.UvicornWorker  --threads 2 app:app