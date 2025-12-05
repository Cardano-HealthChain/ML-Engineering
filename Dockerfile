# syntax=docker/dockerfile:1
ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION}-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

ARG UID=10001

# Install common build tools needed for some Python packages, then clean apt cache
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential gcc \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user to run the app
RUN groupadd -g ${UID} appuser || true \
    && useradd -u ${UID} -g appuser -m -s /usr/sbin/nologin appuser || true

# Copy requirements first to leverage layer caching
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN python -m pip install --upgrade pip setuptools wheel \
    && python -m pip install --no-cache-dir -r requirements.txt

# Copy application files and set ownership
COPY --chown=appuser:appuser . .

USER appuser

EXPOSE 8080

# Use Railway's PORT env var if provided, fallback to 8080
CMD ["sh", "-c", "uvicorn app:app --host 0.0.0.0 --port ${PORT:-8080}"]
