FROM alpine:edge

WORKDIR /usr/src/app

RUN apk --update add nodejs git ruby ruby-dev build-base && \
  apk del build-base && rm -fr /usr/share/ri

RUN npm install -g mrb/ember-watson.git#95387b7

COPY . /usr/src/app

RUN adduser -u 9000 -D app
USER app

CMD ["/usr/src/app/bin/codeclimate-watson"]
