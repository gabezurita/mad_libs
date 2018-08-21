Feature: Manage mad_libs

  Mad Libs are fun word games. You've probably played them at some point,
  if not, check out Wikipedia for more general information:
  http://en.wikipedia.org/wiki/Mad_Libs

  We'd like you to create an application that takes in a mad-lib
  definition, parses it, and then allows users to fill it in. The
  required syntax for a mad-lib is fairly simple, parts of speech
  that should be requested are surrounded by curly braces ('{' and
  '}').

  You should write sufficient code to pass these cucumber tests.
  Running the tests is as simple as running 'bundle exec rake cucumber'.

  Bonus points will be awarded for:
    * Passing more than the model-level Scenarios (remove the @wip tags)
    * Finding and using the helper tools we've included in this
      application stub.
    * Deploying the resultant app on heroku or (for more points)
      Amazon's EC2.
    * Making it look pretty
    * Making use of ajax (you may need to annotate these Scenarios with
      the @javascript tag to make the features pass)
    * Anything else awesome above and beyond passing the tests

  Feel free to ask questions, especially related to getting your
  environment set up. Questions about implementation may not
  necessarily be answered ;) Just email josh@optoro.com

  Good luck!

  Scenario: Create a madlib model
    When I create a madlib with the text:
      """
      I {verb, past-tense} the {noun}. It was {adjective}.
      """
    Then it should have the following fields:
      | label                 |
      | Verb, past-tense (1): |
      | Noun (1):             |
      | Adjective (1):        |
    When I assign the fields these values:
      | label                 | value    |
      | Verb, past-tense (1): | walked   |
      | Noun (1):             | dog      |
      | Adjective (1):        | exciting |
    Then the madlib should resolve to:
      """
      I walked the dog. It was exciting.
      """

  Scenario: create a complicated madlib model
    When I create a madlib with the text:
      """
      Programming is a craft. At its simplest, it comes down to getting a {noun} to do what you want it to do (or what your {noun} wants it to do). As a {job}, you are part listener, part advisor, part interpreter, and part {job}. You try to {verb} {adjective} requirements and find a way of expressing them so that a mere {noun} can do them justice. You try to {verb} your work so that others can {verb} it, and you try to engineer your {noun} so that others can {verb} on it. What's more, you try to do all this against the relentless {verb, ending in -ing} of the {noun}. You work {adjective} miracles every day.
      """
    Then it should have the following fields:
      | label                     |
      | Noun (1):                 |
      | Noun (2):                 |
      | Noun (3):                 |
      | Noun (4):                 |
      | Noun (5):                 |
      | Job (1):                  |
      | Job (2):                  |
      | Verb (1):                 |
      | Verb (2):                 |
      | Verb (3):                 |
      | Verb (4):                 |
      | Adjective (1):            |
      | Adjective (2):            |
      | Verb, ending in -ing (1): |
    When I assign the fields these values:
      | label                     | value         |
      | Noun (1):                 | keyboard cat  |
      | Noun (2):                 | dog           |
      | Noun (3):                 | post-it       |
      | Noun (4):                 | coke          |
      | Noun (5):                 | cup           |
      | Job (1):                  | airline pilot |
      | Job (2):                  | clown         |
      | Verb (1):                 | sit           |
      | Verb (2):                 | jump          |
      | Verb (3):                 | sing          |
      | Verb (4):                 | dance         |
      | Adjective (1):            | shiny         |
      | Adjective (2):            | bright        |
      | Verb, ending in -ing (1): | dancing       |
    Then the madlib should resolve to:
      """
      Programming is a craft. At its simplest, it comes down to getting a keyboard cat to do what you want it to do (or what your dog wants it to do). As a airline pilot, you are part listener, part advisor, part interpreter, and part clown. You try to sit shiny requirements and find a way of expressing them so that a mere post-it can do them justice. You try to jump your work so that others can sing it, and you try to engineer your coke so that others can dance on it. What's more, you try to do all this against the relentless dancing of the cup. You work bright miracles every day.
      """

  ###############################################
  ### STOP Here unless you want bonus points! ###
  ###############################################

  Scenario: Create a madlib via web
    Given I am on the home page
    When I fill in the text:
      """
      I {verb, past-tense} the {noun}. It was {adjective}.
      """
    And I press "Create"
    Then I should see "New Mad Lib created"
    And I should see the following fields:
      | label                 |
      | Verb, past-tense (1): |
      | Noun (1):             |
      | Adjective (1):        |
    When I fill in the fields in this way:
      | label                 | value    |
      | Verb, past-tense (1): | walked   |
      | Noun (1):             | dog      |
      | Adjective (1):        | exciting |
    And I press "Fill In"
    Then I should see:
      """
      I walked the dog. It was exciting.
      """

  Scenario: Create a complicated madlib via web
    Given I am on the home page
    When I fill in the text:
      """
      Programming is a craft. At its simplest, it comes down to getting a {noun} to do what you want it to do (or what your {noun} wants it to do). As a {job}, you are part listener, part advisor, part interpreter, and part {job}. You try to {verb} {adjective} requirements and find a way of expressing them so that a mere {noun} can do them justice. You try to {verb} your work so that others can {verb} it, and you try to engineer your {noun} so that others can {verb} on it. What's more, you try to do all this against the relentless {verb, ending in -ing} of the {noun}. You work {adjective} miracles every day.
      """
    And I press "Create"
    Then I should see "New Mad Lib created"
    And I should see the following fields:
      | label                     |
      | Noun (1):                 |
      | Noun (2):                 |
      | Noun (3):                 |
      | Noun (4):                 |
      | Noun (5):                 |
      | Job (1):                  |
      | Job (2):                  |
      | Verb (1):                 |
      | Verb (2):                 |
      | Verb (3):                 |
      | Verb (4):                 |
      | Adjective (1):            |
      | Adjective (2):            |
      | Verb, ending in -ing (1): |
    When I fill in the fields in this way:
      | label                     | value         |
      | Noun (1):                 | keyboard cat  |
      | Noun (2):                 | dog           |
      | Noun (3):                 | post-it       |
      | Noun (4):                 | coke          |
      | Noun (5):                 | cup           |
      | Job (1):                  | airline pilot |
      | Job (2):                  | clown         |
      | Verb (1):                 | sit           |
      | Verb (2):                 | jump          |
      | Verb (3):                 | sing          |
      | Verb (4):                 | dance         |
      | Adjective (1):            | shiny         |
      | Adjective (2):            | bright        |
      | Verb, ending in -ing (1): | dancing       |
    And I press "Fill In"
    Then I should see "Your solution has been created"
    And I should see:
      """
      Programming is a craft. At its simplest, it comes down to getting a keyboard cat to do what you want it to do (or what your dog wants it to do). As a airline pilot, you are part listener, part advisor, part interpreter, and part clown. You try to sit shiny requirements and find a way of expressing them so that a mere post-it can do them justice. You try to jump your work so that others can sing it, and you try to engineer your coke so that others can dance on it. What's more, you try to do all this against the relentless dancing of the cup. You work bright miracles every day.
      """

  Scenario: web reporting
    Given I input all these madlibs again
    When I go to the reporting page
    Then I should see the following uses:
      | usage         |
      | Nouns: 6      |
      | Verbs: 6      |
      | Adjectives: 3 |
      | Jobs: 2       |
    And I should see the following answers:
      | answer           |
      | walked: 1        |
      | dog: 2           |
      | exciting: 1      |
      | keyboard cat: 1  |
      | post-it: 1       |
      | coke: 1          |
      | cup: 1           |
      | airline pilot: 1 |
      | clown: 1         |
      | sit: 1           |
      | jump: 1          |
      | sing: 1          |
      | dance: 1         |
      | shiny: 1         |
      | bright: 1        |
      | dancing: 1       |
