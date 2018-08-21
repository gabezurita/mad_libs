
# Mad Libs

This is a simple [Mad Libs](https://en.wikipedia.org/wiki/Mad_Libs) app with extensive Cucumber tests.

This app is [live on Heroku](https://libsfous.herokuapp.com/) (where you can try it out):
https://libsfous.herokuapp.com/

In order to make the app look pretty and so it's more user friendly, I added Material Design elements to all the views (using Materialize). I also added some helper text, titles, and a navigation bar.

If I had extra time, I would: 
* Make this into a one page app via Ajax or Vue.js
* Add user accounts, login, and associated views so people can play with each other online
* Add field validations

# Local setup:
`bundle install`
`rails db:migrate`

# Getting Started

To get started with this rails app, you'll want to ensure you have the
correct version of ruby. You should be using MRI 2.4.1. We recommend
using [RVM][1], but use whatever method works best for you. This project
has a `.rvmrc` file included in it to help you get started.

After you have the proper version of ruby, you will need bundler (`gem
install bundler`), then you can run `bundle install` and get to work.

# Running the tests

You should be able to just run `cucumber` from the console and see the
tests run (and fail to start). Sometimes you might have to run `bundle
exec cucumber` depending on your particular environment.
