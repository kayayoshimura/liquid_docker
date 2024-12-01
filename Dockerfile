FROM ruby:3.2

WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential locales && \
    locale-gen ja_JP.UTF-8

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

COPY . .

CMD ["ruby", "app.rb"]
