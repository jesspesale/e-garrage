# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    # used Corneal to do the basic set up
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
    # user and recipe model
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    # user has many recipes
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    # recipe belongs to a user
- [x] Include user accounts with unique login attribute (username or email)
    # can sign up with name, email and password (login with email and password)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    # routes for create, read, update and delete
- [x] Ensure that users can't modify content created by other users
    # Users can only see and modify their own recipes
- [x] Include user input validations
    # name, email and password are validated
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    # When a user types wrong password/ username - flash message
    # When a user forgets a required field - flash message
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message