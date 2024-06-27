# use standard ruby build image
FROM ruby as build-env
WORKDIR /build

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV JEKYLL_ENV production

RUN gem update --system

# first install w/o copying in files, so we can cache dependencies in a layer
# `bundle install` can take a while.
COPY Gemfile .
RUN bundle install

# copy everything in but keep the Gemfile.lock from the original install
# Note that Gemfile.lock is in .dockerignore
COPY . ./

# Now do the much quicker Jekyll build
RUN bundle exec jekyll build --verbose

# use a lightweight run image and copy everything from the build image into it
FROM nginx:mainline-alpine
COPY --from=build-env --chown=nginx:nginx /build/_site /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
