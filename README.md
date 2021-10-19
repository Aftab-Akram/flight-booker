# FlightBooker
This project is a PROTOTYPE of flight booker app. This app help the users achieve the following features:
1. Fliter flights by desired dates / airports and price
2. Book a flight and maintain his previous booking histroy 
3. Pay Online

### Live Link
[FlightBooker](https://flight-booker-v.herokuapp.com/)

### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Bootstrap](https://getbootstrap.com/docs/4.0/getting-started/introduction/)
* [Cocoon](https://github.com/nathanvda/cocoon)
* [Stripe](https://stripe.com)
* [RSpec](https://rspec.info/)

### Prerequisites

* `ruby '2.7.2`
* `rails 6.1.4`


### Installation

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
```
 bundle install 
```

###### STEP 5: Initialize Postgres
```
# Initialize your local postgres database (if a new install)
initdb -D /usr/local/var/postgres

# Start the postgres server process
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

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

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


<!-- CONTACT -->
## Contact
**Aftab Akram** - [LinkedIn](https://www.linkedin.com/in/aftabakram/) - aftabakram04@gmail.com
