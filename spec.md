# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app: my app is an MVC system with the controller routes requiring Sinatra.
- [x] Use ActiveRecord for storing information in a database: I have included tables for each model and migrated them. I also seeded items directly into it's database table.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category): I have included a cart, item, and user model (and a item_cart join model).
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts): I am using has_many in all of my model classes.
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User): I have a cart model that belongs to a user.
- [x] Include user accounts: I have included this.
- [x] Ensure that users can't modify content created by other users: The current user can only see his or her carts.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying: Users are able to create, read, update, and delete their carts.
- [x] Include user input validations: Blank fields or existing usernames redirect to the signup or login page.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code: I have included this.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

Author's Tests

Homepage:
- [x] Homepage loads
- [x] Sign Up link redirects to sign up form
- [x] Log In link redirects to login form

Sign Up:
- [x] Creating a new valid user logs in and redirects to store index
- [x] User can only see his or her shopping carts
- [x] Leaving sign up fields blank or inputting username that already exists redirects to sign up page


Log In:


Shopping:


Carts: