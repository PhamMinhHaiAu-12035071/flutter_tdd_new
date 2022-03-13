Feature: Login Page
  This feature login page

  Scenario Outline: Email is not allow empty
    Given I am on the login page
    When I fill the <email> field with "eve.holt@reqres.in"
    Then I see "eve.holt@reqres.in" on the login page
    When I press the backspace keyboard 18 times
    When I pause for 10 seconds

    Examples:
      | email                             |
      | "loginForm_emailInput_textField"  |