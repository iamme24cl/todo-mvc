# Step 1: Integrate Basic Theme to Asset Pipeline

[X] / - And see a stubbed out, non-dynamic, page with the theme.

# Step 2: Allow people to CRUD  lists.
[X] ListsController
  #index
  - see all their lists
  - doubling as my #new action in that it is presenting the person with a form to create a new list
  / - Index all lists...
- create a list

- show a list

- i need a model
- i nedd a controller
- i should generate resource

Does it impact the DB?
Does it impact my URLS? '/lists/1' #

# Step 3: Add Items to a list
- Make items in a list real
  - a list has many items and every item belongs to a list
lists
id  name
1   Shopping List

Items
id description list_id
1   Milk         1
2   Cookies      1

CREATE ACTION for an ITEM in a LIST - What is the URL/HTTP method for that?
  - The form is already present in the list show page.
  - What URL does this form imply?

POST /lists/:id/items #=> Does it describe which list we are adding an item to?

An item does not exist in our application outside of the context of the list it belongs to

Nested Resource - Items are nested in terms of URLs under their list.

  Does it impact the DB? - Probably a items table - associated with a list
  Does it impact my URLS? '/lists/1' #

# Step 4: Adding Validations
- Validate that lists have a name
- Validate that items have a description

# Step 5: I want to add state (complete, incomplete) to Items in a list
- Marking items as complete or incomplete
  What URLs do I need and how might my database change?
  - the idea of an item being complete or incomplete requires data
  - new forms for updating the status of an item - which means new URL
    /lists/1/items
      PUT/PATCH /lists/1/items/1 - Updating item 1 in list 1
      PUT/PATCH /lists/:list_id/items/:id
  - Need to grab that checkbox HTML from todomvc
      <input class="toggle" type="checkbox">

  - I need that JS function to submit the form when you click the checkbox
      $(function(){
        $("input.toggle").on("change", function(){
          $(this).parents("form").trigger("submit")
          })
      });
  # REFACTOR 1: Start using partials in lists/show

# Step 6: Deleting Items from a lists
  - I know I need a new button or link for the delete.
  - That needs to hit some sort of URL - we can look that up.
    - How do I trigger a DELETE request?
    - Browsers only support GET and POST

  - a controller action to process the deleting of the item.

# Step 7: User Signup and Login
how does it impact my db
  - a new model, user, email
what URLs do I need?
  get /users/new to users#new
    - form
  post /users to users#create
    - create the user in the db

  get /login to sessions/new
    - form
  post /login to sessions/create
    - log the user in
  post /logout to sessions/destroy


# Step 8: Users have lists and can only see their lists.*


# Step fix: Fix Down arrow on Make list form.

# OAUTH2 Flow:
1. The user goes to '/auth/provider' on my site
2. Omniauth redirects them to Github, providing it with the key and secret identifying my application.
   This lets github know which of the thousands of applications that use Github for authentication the user is trying to log into.
3. The user logs in with Github.
4. Github redirects them back to my application (callback url) and provides my application with a secret code that represents the user on Github.
5. My application sends that secret code back to Github.
6. Github confirms that the code came from Github and that my application received it.
7. Github sends me back the user's data.
