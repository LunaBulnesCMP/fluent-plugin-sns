FROM fluent/fluentd:v1.12.2-debian-1.0

EXPOSE 24224

USER root

RUN mkdir localgem
COPY *.gem localgem/*.gem
COPY ./config fluentd/etc/

RUN gem install localgem/*.gem
