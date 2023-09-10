FROM ruby:3.2.2

RUN apt-get install -y curl

ENV NODE_VERSION=14.16.0
ENV NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ENV NODE_HOME=/opt/$NODE_PACKAGE

ENV NODE_PATH=$NODE_HOME/lib/node_modules
ENV PATH=$NODE_HOME/bin:$PATH

RUN curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /opt/
RUN npm install -g yarn


ENV RAILS_ROOT /app
RUN mkdir /app
WORKDIR /app
RUN gem install bundler 

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5

# Copy the main application.
ADD . .

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-t", "0:8", "-p", "3000"]