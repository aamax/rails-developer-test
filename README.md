# Simple News App - Rails Competency Test For T2Modus

This application has been made in compliance with instructions at: https://github.com/t2modus/rails-developer-test

I did not record myself working on it so no extra credit :( 

I have not spent much time trying to deliver a fancy UI or UX.  I am shooting to demonstrate basic functionality and compentency and if you'd like to see more, please ask.  This is being working into a very busy schedule as I wrap up my current job and deal with some pressing family issues.  I am willing to go deeper if necessary so please let me know.

I created a seed file to populate the database for working with the UI.  This seed data consists of 4 users:
* vanilla@example.com
* editor1@example.com
* editor2@example.com
* admin@example.com

Each user has the role as described by the email address and the password for each is the word: password.

I have also created article data using the FFaker gem to make a set of articles with basically random values.

## User Personas
The project will has multiple roles that interact with each other.
* Guest (No Login)
* Vanilla Users (Logged in - No special role)
* Editor Users
* Admin Users *(Extra Credit)*

## User Functionality
##### Guests (No Login)
* Can see homepage with first 3 articles from each category.
* Can see article index page.
* Are sent to signup page if they want to see article show page.
* Can signup 
* Can Login

##### Vanilla Users
* Can see everything a guest can
* Can see article show pages. 
* Can logout

##### Editor Users
* Can do everything a vanilla User can.
* Can create articles
* Can delete articles that they created
* Can edit articles that they created

##### Admin User *(Extra Credit)*
* Can create users and set roles.
* Can edit users and change roles.
* Can't edit/destroy/create articles.

## Article Table
Table will contain **title**, **content**, **category**, **user_id**.

## Roles
Use one of these gems: **Petergate** *(Preferred)*, Pundit, Cancancan.

I have never used Petergate before but am using it as it's preferred.  
I've used both of the others (and personally have grown to like Pundit).  
I like using Rolify to manage roles and Pundit for authorization usually.
 
###### Role Names
* user
* editor
* admin *(Extra Credit)*

## Database
sqlite is the database

## Testing
minitest is the test framework. 

## Authentication
Devise is used for authentication.

## Templating
slim *(Prefered)*, haml, **erb**

(I haven't used slim before and in the interest of time just used erb... I can definitely update it using slim)
I have writtent this over the weekend while visit with my Mother in SC as I told you before.  I apologize if 
it's not as solid as it could be or that I'm using erb instead of slim...  I just don't have enough
bandwidth for all of this right now and wanted to get something to you as quickly as I could. 
I hope you understand. 

Max
