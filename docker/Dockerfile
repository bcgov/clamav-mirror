FROM alpine:latest
ENV PYTHONUNBUFFERED 1
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.15/community' >> /etc/apk/repositories 

# python3 shared with most images
RUN apk add --no-cache \
    python3 py3-pip \
  && pip3 install --upgrade pip
# Image specific layers under this line
RUN apk add --no-cache bash caddy \
    fcron=3.2.1-r2 \ 
    && rm -rf /var/cache/apk/*

# Install CVD-Update
RUN pip install --no-cache-dir cvdupdate

RUN chmod +r /etc/fcron/*

COPY src/ .
COPY start.py /start.py
RUN chmod +x /entrypoint.sh

EXPOSE 8080
CMD /start.py