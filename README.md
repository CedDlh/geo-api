# README

## Introduction

This app has been created with a Rails framework in which a devise and pundit has been added in order to secure the endpoint .

A model and DB have also been created for the location so the program could in a future version handle saving the requests created and handle multiple users with different login credentials.

#### The API controller is available: [here](app/controllers/api/v1/locations_controller.rb)

#### The service requesting and returning the coordinates: [here](app/services/geoloc_api_service.rb)

## Setup

This API endpoint is not publicly available and a user needs to be logged in order to make a request.
To install the relevant gems execute a ``bundle install`` on start.
To generate a user automatically : Run the command ``rails db:seed``.
To retrieve the unique user Token associated  : run ``Rails c`` and ``User.last``.

>Example : 
![image](https://drive.google.com/uc?export=view&id=1IA04ghdHFAzqlhTdMK3QZuNmfy80n3M6)

Before making a HTTP request via Postman, the following headers need to be added :
- content-Type	=> 	application/json
- X-User-Email =>		me@me.com
- X-User-Token =>		"Token Generated Above"

>Example : 
![image](https://drive.google.com/uc?export=view&id=1j3QK8H65w6JkNAR8adhX001LuBrC4MDt)

## Test request

After launching the server with ``rails s``, you can use any of the 5 test emails below. 
They will either return as a result the correct lat/long in a JSON format or raise an error when appropriate :
- http://localhost:3000/api/v1/locations?address=notre-dame-de-paris
- http://localhost:3000/api/v1/locations?address=checkpoint-charlie
- http://localhost:3000/api/v1/locations?address=statue-of-liberty
- http://localhost:3000/api/v1/locations?address=
- http://localhost:3000/api/v1/locations?address=zzzzzzzzzzzzzzzzzz

If an error arise from the 3rd party provider, this program will handle it by raise a 500 server error asking to retry later in order to not break the total application.

