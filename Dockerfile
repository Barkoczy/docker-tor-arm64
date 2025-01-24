FROM arm64v8/debian:bookworm-slim

RUN apt-get update && apt-get install -y curl gpg apt-transport-https
RUN curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org bookworm main" > /etc/apt/sources.list.d/tor.list

RUN apt-get update && apt-get install -y tor

RUN sed -i 's/#SOCKSPort 9050/SOCKSPort 0.0.0.0:9050/' /etc/tor/torrc

USER debian-tor
CMD ["/usr/bin/tor", "-f", "/etc/tor/torrc"]