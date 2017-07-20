# Crushmet ReadMe

![Crushmet-main](/app/assets/images/crushmet-main.png)

## _Description_

Crushmet enables users to track the metrics of their application through events.Users can register their applications and immediately start tracking the events.

Crushmet has been built with the Ruby on Rails(5.1.1) web development framework.

## _Dependencies_
The main dependencies for the app are:

- devise - authentication
- rack-cors - establish cross origin resource sharing
- chartkick/groupdate - to establish charting capabilities for the application events
- faker - seed fake database
- shoulda - validate active record associations in rspec tests.
- factory_girl_rails - establish factories for the models for use in testing.
- bootswatch-rails - style the views

## _User Stories_

The following user stories are part of _Crushmet_ -

1. Users need to _sign up_ for Crushmet.
2. Users need to _sign in and out_ of Crushmet.
3. Users need to _register_, _edit_ and _remove_ their applications.
4. Users can track the events from the registered applications.

## _Solutions_

#### User Authentication :
For Authentication,I have used the _Devise_ gem which is a flexible authentication model based on _Warden_.Devise comes with a vareity of modules to pick and choose from.I've used the following modules in Cogniden- database_authenticatable, registerable, confirmable, recoverable, rememberable, recoverable, trackable, validatable.You can checkout Devise's [wiki](https://github.com/plataformatec/devise/wiki "devise wiki") for more information on the modules and how to use devise.

#### User Models :
Users have the ability to register their applications, and applications in turn will publish their respective _events_ to Crushmet for tracking metrics.The ActiveRecord Association _has_many_ is used to establish the relationship between the three entities.

```class User < ApplicationRecord
      devise :database_authenticatable, :registerable, :confirmable,
             :recoverable, :rememberable, :trackable, :validatable
      has_many :registered_applications, dependent: :destroy
    end
    ```

```class RegisteredApplication < ApplicationRecord
      belongs_to :user
      has_many :events, dependent: :destroy
    end
    ```
 ```class Event < ApplicationRecord
       belongs_to :registered_application
     end
     ```

## _Results_

The screenshots below depicts the various user stories for Crushmet and the gradual progression of user stories from Authentication,app registration and events subscription for the app.

#### Authentication
--------------------
* **User Sign up ,Sign up confirmation and Sign in**.
A new user signs up with firstname, lastname, email and password, confirms his email and is then redirected to the sign in page.

![sign up 1](/app/assets/images/signup1.png "Sign Up")

![sign up 2](/app/assets/images/signup2.png "Sign Up")

![sign in](/app/assets/images/login.png "Sign In")

![sign in success](/app/assets/images/loginsuccessful.png "Sign In successful")


#### User Apps
------------------
* Register an App, edit and remove app.

1. Register a new application

![register app](/app/assets/images/registerapp.png "register application")

![register app success](/app/assets/images/registerappsuccess.png "register app success")

![show apps](/app/assets/images/showapps.png "show apps")

2. Edit an application

![edit app](/app/assets/images/editapp.png "edit app")

![edit app success](/app/assets/images/editappsuccess.png "edit app success")

3. Remove an application

![remove app](/app/assets/images/removeapp.png "remove app")

![remove app success](/app/assets/images/removeappsuccess.png "remove app success")


#### Application Events
-----------------------

![events](/app/assets/images/events.png "events")

## Run _Crushmet_ App

1. Clone github project

    `>git clone git@github.com:praveenyr/crushmet.git`

2. Install Dependencies from gem file

    `> bundle install`

3. Configure the postgres development database in _database.yml_

    ```development:
      adapter: postgresql
      database: praveen
      host: localhost
    ```

2. Create development database and seed database

    `rake db:reset`

3. Start the app in development environment

    `rails s`

4.  Rspec tests

    1. Set Rails Env variable to _test_

        `RAILS_ENV=test`

    2. Run db migrations in test environment.

        `rake db:migrate`

    3. Run rspec tests

         `rspec /spec/controllers/<controller>`




## Client side script

* Use the following client side javascript to publish events to crushmet.

Add the following code snippet to your application under /app/assets/javascripts/application.js -

`var crushmet = {};

crushmet.report = function(eventName) {
   var event = { event: { name: eventName }};

   var request = new XMLHttpRequest();

   request.open("POST", "http://localhost:3000/api/events", true);
   request.setRequestHeader('Content-Type', 'application/json');
   request.send(JSON.stringify(event));

  };

<!-- Publishes a sample event with eventname "sale" -->
crushmet.report("sale");`
