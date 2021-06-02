FROM fluent/fluentd:v1.12.2-debian-1.0

EXPOSE 24224

USER root

RUN apt-get update
RUN apt-get install build-essential -y
RUN gem install jeweler

RUN mkdir localgem
COPY lib/ localgem/lib/
COPY fluent-plugin-sns.gemspec localgem/fluent-plugin-sns.gemspec
COPY Rakefile localgem/Rakefile
COPY VERSION localgem/VERSION

