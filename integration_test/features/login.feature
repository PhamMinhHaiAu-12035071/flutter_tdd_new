Feature: Login Page
  This feature login page

  Scenario Outline: Email is not allow empty
    When I fill the <email> field with "au dep trai"
    Then I pause for 10 seconds

    Examples:
      | email                             |
      | "loginForm_emailInput_textField"  |