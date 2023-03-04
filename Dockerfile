FROM ruby:3.1


# Set timezone
ENV TZ=Asia/Tokyo

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Bundlerの不具合対策(1)
RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 5000
# EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
