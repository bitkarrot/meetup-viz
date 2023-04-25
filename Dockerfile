FROM python:3.9-slim-buster

WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Poetry and dependencies
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
RUN poetry install --no-root --no-dev

# Expose port 8000 for gunicorn
EXPOSE 8000

# Run the command to start gunicorn
CMD ["poetry", "run", "gunicorn", "app:server", "--bind", "0.0.0.0:8000"]
