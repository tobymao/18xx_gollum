FROM ruby:2.7.1-buster

EXPOSE 4567

# Install deps - cmake
RUN apt-get update && \
    apt-get install -y cmake && \
    rm -rf /var/lib/apt/lists/*

# Install gollum
RUN gem install gollum

# Create data folder
RUN mkdir /root/wikidata
RUN git init /root/wikidata

CMD ["gollum", "/root/wikidata"]
