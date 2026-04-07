# Install ruby version 3.1.0.
FROM ruby:3.1.0

#The application by default runs in port 3000
EXPOSE 3000

#convention
WORKDIR /usr/src/app

#Install the correct version of bundler with gem install bundler:2.3.3
RUN gem install bundler:2.3.3

# Copy the files required for dependencies to be installed
#The COPY will copy both files Gemfile and Gemfile.lock to the current directory. 
#This will help us by caching the dependency layers if we ever need to make changes to the source code. 
#The same kind of caching trick works in many other languages or frameworks, such as Node.js.
COPY Gemfile* ./

#Run bundle install to install all dependencies specified in the Gemfile
RUN bundle install

#copy all of the source code
COPY . .

#Run migrations with rails db:migrate RAILS_ENV=production
RUN rails db:migrate RAILS_ENV=production

#Precompile your assets with rake assets:precompile
RUN rake assets:precompile

#Run rails s -e production to start the project in production mode
CMD ["rails", "s", "-e", "production"]