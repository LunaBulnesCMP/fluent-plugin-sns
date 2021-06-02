FROM fluent/fluentd:v1.12.2-debian-1.0

EXPOSE 24224

USER root

RUN mkdir localgem
COPY fluent-plugin-sns-3.2.0.gem localgem/fluent-plugin-sns-3.2.0.gem

RUN gem install localgem/fluent-plugin-sns-3.2.0.gem
