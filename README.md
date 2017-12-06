Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
# rails-jingma-api


- When using PostMan to test functionality reference the routes below for the are titled "Enter request URL" and the corresponding verb, PATCH, GET, POST, etc..

-When modifying api/v1/items, it requires that X-User-Email & X-User-Token is populated under the headers tab, for example:

Key                   Value
X-User-Email        fake@fake.com
X-User-Token        Keo2Gu4XAXkRV_KFpS4g


- These two values can be accessed through the terminal once your initial user is created: user = User.new / user.email = fake@fake.com / user.password = password / user.save!

-When simply typing user it'll populate the email, password, and the encrypted token so you'll be able to create,update,delete things using the email and token in Postman.


                      ===> Rails Routes Below <===

Prefix       Verb        URI Pattern                    Controller#Action

n_user_sess  GET    /users/sign_in(.:format)       devise/sessions#new
user_sess    POST   /users/sign_in(.:format)       devise/sessions#create
d_user_sess DELETE /users/sign_out(.:format)      devise/sessions#destroy
n_user_pw    GET    /users/password/new(.:format)  devise/passwords#new
e_user_pw    GET    /users/password/edit(.:format) devise/passwords#edit
user_pw     PATCH  /users/password(.:format)      devise/passwords#update
            PUT    /users/password(.:format)      devise/passwords#update
            POST   /users/password(.:format)      devise/passwords#create
ca_user_reg GET    /users/cancel(.:format)        devise/registrations#cancel
n_user_reg  GET    /users/sign_up(.:format)       devise/registrations#new
e_user_reg  GET    /users/edit(.:format)          devise/registrations#edit
user_reg   PATCH  /users(.:format)               devise/registrations#update
            PUT    /users(.:format)               devise/registrations#update
          DELETE /users(.:format)               devise/registrations#destroy
            POST   /users(.:format)               devise/registrations#create

api_v1_users POST   /api/v1/users(.:format)    api/v1/users#create {:format=>:json}
api_v1_user PATCH  /api/v1/users/:id(.:format)    api/v1/users#update {:format=>:json
             PUT    /api/v1/users/:id(.:format)    api/v1/users#update{:format=>:json}
 api_v1_items GET    /api/v1/items(.:format)        api/v1/items#index{:format=>:json}
             POST   /api/v1/items(.:format)        api/v1/items#create{:format=>:json}
api_v1_item  GET    /api/v1/items/:id(.:format)    api/v1/items#show{:format=>:json}
             PATCH  /api/v1/items/:id(.:format)    api/v1/items#update{:format=>:json}
             PUT    /api/v1/items/:id(.:format)    api/v1/items#update{:format=>:json}
             DELETE /api/v1/items/:id(.:format)   api/v1/items#destroy{:format=>:json}



             curl -i -X POST                                                              \
              -H 'Content-Type: application/json'                                     \
              -d '{ "code": "013sKicd1B9Dnr02u2cd1qH9cd1sKicl", "user": { "name": "mo", "avatar_url": "www.salmon.com","gender": "1","province": "bangkok","city": "Thailand"} }' \
              https://jinma.herokuapp.com/api/v1/users

              curl -i -X POST                                                              \
               -H 'Content-Type: application/json'                                     \
               -d '{ "code": "013sKicd1B9Dnr02u2cd1qH9cd1sKicl", "user": { "name": "mo", "avatar_url": "www.salmon.com","gender": "1","province": "bangkok","city": "Thailand"} }' \
               http://localhost:3000/api/v1/users
