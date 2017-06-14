# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
  Rails v 5.0
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  Studio has_many GroupClasses
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Review belongs_to User
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  Studio has_many Reviews, through GroupClasses
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  User can submit GroupClass name and duration
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  See Studio, GroupClass, and Review models
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  Review.best_review
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
  Used custom attribute writer to create a group class while leaving a review for a studio
- [x] Include signup (how e.g. Devise)
  Devise
- [x] Include login (how e.g. Devise)
  Devise
- [x] Include logout (how e.g. Devise)
  Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  Devise, OmniAuth Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  /studios/:id/group_classes/new
  Can add Review through GroupClass show view
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  ActiveRecord validations raise errors when inputs are invalid

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [x] Views use partials if appropriate - partial for reviews
