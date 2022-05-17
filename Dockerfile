FROM ruby:3.1.1
RUN apt update -qq && apt install -y build-essential libpq-dev nodejs yarn
RUN mkdir /myapp
WORKDIR /myapp
COPY ./Gemfile /myapp/Gemfile
ADD ../Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD ../ /myapp
CMD sh
