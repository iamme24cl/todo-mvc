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

# Step 6: Deleting Items from a lists


# Step fix: Fix Down arrow on Make list form.
