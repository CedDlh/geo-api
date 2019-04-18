#README

##Introduction

This app has been created with a Rails framework in which a devise and pundit has been added in order to secure the endpoint .

A model and DB have also been created for the location so the program could in a future version handle saving the requests created and handle multiple users with different login credentials.

The API controller is available here : 
Geo-api/app/controllers/api/v1/locations_controller.rb

The service requesting and returning the coordinates here:
Geo-api/app/services/geoloc_api_service.rb

##Setup

This API endpoint is not publicly available and a user needs to be logged in order to make a request.
In order to install the relevant gems execute a "bundle install" on start.
To generate a user automatically : Run the command rails db:seed on start.
To retrieve the unique user Token associated  : run Rails c and User.last.

Example : 
![image](https://drive.google.com/uc?export=view&id=1IA04ghdHFAzqlhTdMK3QZuNmfy80n3M6)

Before making a HTTP request via Postman, the following headers need to be added :
content-Type		application/json
X-User-Email		me@me.com
X-User-Token		"Token Generated Above"

Example : 
![image](https://drive.google.com/uc?export=view&id=1j3QK8H65w6JkNAR8adhX001LuBrC4MDt)

##Test request

You will find below 5 test emails with the result or error they should raise if appropriate :



If an error arise from the 3rd party provider, this program will handle it by raise a 500 server error asking to retry later in order to not break the total application.

