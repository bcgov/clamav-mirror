FROM alpine:latest
ENV PYTHONUNBUFFERED 1

# Required for fcron since it uses the stable version instead of the beta version
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.15/community' >> /etc/apk/repositories 

# python3 shared with most images
RUN apk add --no-cache \
    python3 py3-pip \
  && pip3 install --upgrade pip

# Install Bash, Caddy and Fcron
RUN apk add --no-cache bash caddy \
    fcron=3.2.1-r2 \ 
    && rm -rf /var/cache/apk/*

# Install CVD-Update
RUN pip install --no-cache-dir cvdupdate

# Grant read permission
RUN chmod +r /etc/fcron/*

# Copy SRC to root
COPY src/ .

# Copy start script to root
COPY start.py /start.py

# Change entrypoint to executable
RUN chmod +x /entrypoint.sh

# Expose port 8080 for web server
EXPOSE 8080

# Run the script
CMD ["/start.py"]