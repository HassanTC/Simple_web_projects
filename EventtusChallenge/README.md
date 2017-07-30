# Eventtus Challenge

#### OVERVIEW

  Do not Build anything from scratch !

    it's a Google Algorithm, which i can describe it on the following lines
      1 - I know I want to implement a feature... Google search to see
          if anyone implemented the same feature. Land on a Stack Overflow post
          / Github projects that describes how to implement a similar feature.
      2 - The SO and github shows me the right direction to take,
          so I Google for the specific method it mentioned that I don't understand.
          I end up on the Rails Guides page that talks about it
      3 - I pull up my completed version of the solution to make sure I've got
          the syntax correct and possibly to help write tests
          while I implement the feature
    that was simply my approach while solving this Challenge

### [example](https://github.com/teohm/natives)


### Ruby Gem

   Gem Design is tested OOP

    Object oriented code should be organized in single-purpose classes,
    so it is easier to maintain and modify.
    Describing a program in plain English
    and identifying the nouns in the description is a good way
    to identify classes in a program.
    The objective’s Collector (which collect the gem list from your Gemfile )
    and Viewer (which show you dependencies required) and the verbs will
    correspond to behavior we give objects in the form of methods

  BDD

     i used `rspec` for testing because
     it will be very useful for both testing and documenting the Gem

### [API web service](http://checkyapi.herokuapp.com)
   Database
     Simply i Created 3 tables
      1 - Operating systems
      2 - System libararies
      3 - Gem
    and a tirnary relationship table between of them
    according to the ER Digram and because if there are any additional changes
    later

##### i am sure that i did not implement the DB perfectly
  The API

    all the app is contain only 2 APIs
    i implemented them without any additional gems and without using any caching
    because i believe its pretty simple and small job, so no need to keep things
    complicated till we get new business logic
    like adding authentication system or such other things
