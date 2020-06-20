FROM ruby:2.7.1-slim

ENV RAILS_ENV=production

WORKDIR /app

COPY Gemfile* /app/

RUN apt-get update -qq && apt-get install -y build-essential && \
    bundle install --jobs=4

ADD . /app

RUN bundle exec rake assets:precompile 

RUN chown -R nobody:nogroup /app

USER nobody

EXPOSE 3000

CMD bundle exec puma -p ${PORT:-3000} -e ${RACK_ENV:-development}
