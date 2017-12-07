Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
# rails-jingma-api

                      ==>ItemsController<==
                           KaminariGem
The above mentioned gem is used to create a total of 20 items shown per page. Inside the items model there is "paginates_per," which allows you to designate how many items per post you want displayed, in our case its 20.

Inside the ItemController index method we have:
  -- @items = policy_scope(Item).page(params[:page])
which allows for a total of 20 items per post to be displayed.

Inside the index.json.jbuilder we allow the user to see the previous or next page with the following:

json.prev_page path_to_prev_page(@items)
json.next_page path_to_next_page(@items)


                      ==>CommentControllerAPI<==
User can use appropriate VERB with corresponding URI Pattern to execute this API
through the Postman application. For example to use the create-comment-method the
two paramaters it takes are: id, and the body(comment). See below:
  [
    {
        "id": 1,
        "body": "EXAMPLE COMMENT HERE"
    }
]

This syntax above would create a comment for the item with id:1, the body field is the
area where the comment for item with id:1 would be populated.

                      ==>LikesControllerAPI<==
                        act_as_votable gem
User can use appropriate VERB with corresponding URI Pattern to execute this API
through the Postman application. For example to use the like-method the
user needs to identify which item_id they intend to like. See below:

-->This will generate a LIKE for item_id:4


VERB                URI PATTERN
POST    http://localhost:3000/api/v1/likes/like
{
  "item_id": 4
}

-->This will generate a UNLIKE for item_id:4

POST    http://localhost:3000/api/v1/likes/unlike
{
  "item_id": 4
}


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
