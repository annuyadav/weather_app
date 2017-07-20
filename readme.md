# Weather App

Weather App is a app that whill show the wether condition of any city, state or geo location from earth.


## Getting Started

These instructions will get you a copy of the project up and running on your local machine to try.

### Prerequisites

Assuming you have installed `git`, `ruby`, `rails` and `rvm` or any other `ruby version manager` like `rbenv`.


### Installing

```
git clone git@github.com:annuyadav/weather_app.git
cd weather_app
```

This will automatically create a gemset name `weather_app`. Install `bundler` if you don't have.

`gem install bundler`

Now install all other gems using command

```
bundle install
```

## Running the program

Start server

```
rails s
```

Open in browser

Here you will see a form. Enter details and see the weather forcast.


## Author

**Annu Yadav**


## How to use
* Enter in the directory application is cloned.
* Run bundle install
    cd /path/to/application
    bundle
* Copy config/database.yml.example to config/database.yml
* Update the user and password in database.yml
* Copy config/secrets.yml.example to config/secrets.yml
* Create database and migrate.
* Start the server.
    rake db:create db:migrate
    rails s

* First sign up by entering the details.
* Confirm the email.
* Login with credentials
* Add ToDo list, ToDo items.
* Share ToDo with other user available on applications.
* Add and remove ToDo items to the ToDo list.
* Mark ToDo list done.