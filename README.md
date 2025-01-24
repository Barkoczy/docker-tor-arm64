# Tor ARM64 Docker Image

Privacy-focused SOCKS proxy server built for ARM64 architecture.

## Usage

```bash
docker pull quickbiteschronicles/tor-arm64:latest
docker run -p 9050:9050 quickbiteschronicles/tor-arm64:latest
```

## Docker Compose Example

```yaml
services:
  tor:
    image: quickbiteschronicles/tor-arm64:latest
    ports:
      - "9050:9050"
    deploy:
      resources:
        limits:
          memory: 256M
        reservations:
          memory: 128M
```

## Build

```bash
docker buildx build --platform linux/arm64 -t quickbiteschronicles/tor-arm64:latest --push .
```

## License
Based on official Tor package. [BSD 3-Clause License](https://gitweb.torproject.org/tor.git/tree/LICENSE)