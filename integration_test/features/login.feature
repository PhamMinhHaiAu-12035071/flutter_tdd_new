Feature: Login Page
  This feature login page

  Scenario Outline: Email is not allow empty
    Given I am on the login page
    When I fill the <email> field with "eve.holt@reqres.in"
    Then I see "eve.holt@reqres.in" on the login page
    When I press the backspace keyboard 18 times
    Then I see "Email is not empty" on the login page
    And I expect the "Login" button to be disabled

    Examples:
      | email                               |
      | "loginForm_emailInput_textField"    |

#  Scenario Outline: Password is not allow empty
#    Given I am on the login page
#    When I fill the <password> field with "123456"
#    And I press the backspace keyboard 18 times
#    Then I see "Password is not empty" on the login page
#    And I expect the "Login" button to be disableddisabled
#
#    Examples:
#      | password                             |
#      | "loginForm_passwordInput_textField"  |