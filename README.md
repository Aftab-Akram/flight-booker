# README

This repository is the code for the [flight-booker](https://github.com/Aftab-Akram/flight-booker) project.

# Dependencies

 - `ruby` 2.7.6
 - `postgres` 11


### How do I get set up? ###

###### STEP 1: Install dependencies
If you are on a Mac, first install [Homebrew](https://brew.sh/).

Install homebrew dependencies *first* to avoid accidentally picking up ones bundled with Mac OS, which may not be compatible.
```
brew install postgresql
brew link postgresql
```

###### STEP 2: Clone the repository
```
git clone https://github.com/Aftab-Akram/flight-booker
```

Alternatively, SourceTree can be used instead of command line git.


###### STEP 3: Install rbenv
* Install [rbenv](https://github.com/rbenv/rbenv) and [rbenv-gemset](https://github.com/jf/rbenv-gemset)


###### STEP 4: Install ruby through rbenv
```
cd flight-booker
rbenv install
```
* Alternatively, if you use rvm: `rvm use $(cat .ruby-version) --install`


###### STEP 4: Install bundler
We specify an exact version of bundler to avoid inconsistency
```
BUNDLER_VERSION=$(grep -C1 'BUNDLED WITH' Gemfile.lock | tail -n1 | tr -d '[:space:]')
gem install bundler --version "=$BUNDLER_VERSION"
```

###### STEP 5: Initialize Postgres
```
# Initialize your local postgres database (if a new install)
initdb -D /usr/local/var/postgres

# Start the postgres server process
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

# Create a development and test db
createdb flight-booker_development
createdb flight-booker_test

# To stop postgres (when needed)
# pg_ctl -D /usr/local/var/postgres stop
```

###### STEP 6: Set up flight-booker\_develop and test databases.
```
bin/rake db:setup
```

###### STEP 7: Get config/master.key
Create the development credential key file under ```config/master.key```

```
echo 'MASTER KEY GOES HERE' > config/master.key
```

###### STEP 8: Start Servers
Run `rails s` and visit http://localhost:3000

  * The client Webpack development server should now be running on port 3000
  * Browser hot module reloading is enabled for the client app

###### STEP 9: Sign Up / Log In

A user record will be created in your database when you first sign up.

```
http://localhost:3000
[Sign Up]
```


If there's an unexpected error, you may not be able to log in or out. Visit this
address for a fresh start.

```
http://localhost:3000/logout
```

Happy coding!

Be sure to visit the [doc/coding-hints.md](doc/coding-hints.md) document.

Be sure to visit the [doc/hot-fixes.md](doc/hot-fixes.md) document, on How to do Hot fixes.


### Additional Tools ###

[Prettier](https://prettier.io/docs/en/editors.html) and [Rubocop](https://rubocop.org/) are used for source formatting js and ruby respectively. Editor integration is recommended for [Prettier](https://prettier.io/docs/en/editors.html) and [Rubocop](https://docs.rubocop.org/rubocop/0.89/integration_with_other_tools.html).

