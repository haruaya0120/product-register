FROM ruby:2.7.8
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    curl && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs
RUN npm install --global yarn --force
RUN gem install rubygems-update -v 3.2.33
RUN update_rubygems
WORKDIR /product-register
RUN gem install bundler:1.17.3
COPY Gemfile Gemfile.lock /product-register/
RUN bundle install