# foosy
Your new favourite foosball tracker. 

# ABOUT
Application that allows you to track foosball games. Create players and games and score up to 10 goals to win. View ranking page for top players of the day and of all time and make sure you are the most active player of the day! Styled with Bootstrap, additionally validated with JS, response prepared with AJAX, decorated with Draper, tested with RSpec and Capybara.

# CONFIGURE:

* <tt>git clone git://github.com/zuzannast/foosy.git</tt> clone my repo

* Set up <tt>database.yml</tt> with your mysql data

* <tt>rake db:create</tt>

* <tt>rake db:migrate</tt>

* <tt>rake db:seed</tt> if you want to have players and empty games added automatically

* <tt>rspec</tt> to check if tests are passing

# Live on Heroku!
http://foosy.herokuapp.com

# Cheers!

# ToDo later:
* connect with cloud to store images for Heroku
* minimize SQL requests
