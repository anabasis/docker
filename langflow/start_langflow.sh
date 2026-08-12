docker run -p 7860:7860 --name langflow -e LANGFLOW_SSRF_ALLOWED_HOSTS="host.docker.internal,localhost,127.0.0.1" langflowai/langflow:latest
