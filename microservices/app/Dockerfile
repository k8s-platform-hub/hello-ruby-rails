FROM ruby:2.3.3-alpine

ENV APP_HOME /myapp/
ADD src/Gemfile* $APP_HOME

RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev libxml2-dev libxslt-dev \
    postgresql-dev sqlite-dev  libc-dev linux-headers nodejs tzdata

RUN gem install bundler

RUN cd $APP_HOME ; bundle config build.nokogiri --use-system-libraries && bundle install

ADD src/ $APP_HOME

WORKDIR $APP_HOME
CMD ["sh", "-c", "bundle exec rake db:migrate && bundle exec rails s -p 8080"]
