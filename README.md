# README

[Upskill](http://upskillcourses.com) Software-as-a-Service Ruby on Rails App

Notes for loading contact page:
Step 1- client sends GET request to load page
Step 2- web server catches GET request
Step 3- web server talks to rails, goes to routes file first
Step 4- routes file processes request will end up at: get 'contact-us', to: 'contacts#new', as: 'new_contact'
        which says go to contact controller and do the new action
Step 5- "new" function gets run in the controller file, which goes to the contacts view html file
        instance variable(s) from contact controller new action are used in new.html.erb
Step 6- controller sends html file to web server (puma).
Step 7- web server sends http response

Notes for when user submits on contact page:
Step 1- customer fills out form and sumbits
Step 2- POST request is sent to server
Step 3- web server (puma) sends request to rails
Step 4- goes to routes file, finds create and then goes to controller.
Step 5- Contacts#create action is run in the controller file
        controller will always run all its code and look for corresponding view file unless told otherwise
        new action tells otherwise because a view file isnt needed to make a new contact object
Step 6- Contacts#new action is run
Step 7- HTTP response is sent 
Step 8- HTML is rendered by client broswer

- Query string parameter passing information through links; information after a ? mark in the link 
- access any hash with params keyword ex. params[:user] = '2'

To append db need to 
- run rails g migration name_of_thing
- add your db change to that file 