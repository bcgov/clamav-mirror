FROM docker.io/python:3.12-alpine
ENV PYTHONUNBUFFERED 1
WORKDIR /opt/app-root/src

# Install Bash and Caddy
RUN apk add --no-cache bash caddy \
 && rm -rf /var/cache/apk/*

# Install CVD-Update
RUN pip install --no-cache-dir cvdupdate

# Copy Scripts
COPY src/ $WORKDIR
RUN chmod +x ./entrypoint.sh

# Start Server
EXPOSE 8080
CMD [ "./entrypoint.sh", "serve" ]
