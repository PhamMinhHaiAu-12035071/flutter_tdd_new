Feature: Login Page
  This feature login page

  Scenario Outline: LoginForm will show error message when field is empty
    Given I am on the login page
    When I fill the <email> field with "eve.holt@reqres.in"
    Then I should see "eve.holt@reqres.in"
    And I clear text on the <email> field
    Then I should see "Email is not empty"
    And I expect the "Submit" button to be disabled
    When I fill the <password> field with "123456"
    And I clear text on the <password> field
    Then I should see "Password is not empty"
    And I expect the "Submit" button to be disabled

    Examples:
      | email                               | password                            |
      | "loginForm_emailInput_textField"    | "loginForm_passwordInput_textField" |

  Scenario Outline: LoginForm with field valid
    Given I am on the login page
    When I fill the <email> field with "eve.holt@reqres.in"
    Then I should see "eve.holt@reqres.in"
    And I expect the "Submit" button to be disabled
    When I fill the <password> field with "123456"
    And I expect the "Submit" button to be enabled

    Examples:
      | email                               | password                            |
      | "loginForm_emailInput_textField"    | "loginForm_passwordInput_textField" |

#  Scenario Outline: Login failed
#    Given I am on the login page
#    When I fill the <email> field with "peter@klaven"
#    Then I should see "peter@klaven"
#    And I expect the "Submit" button to be disabled
#    When I fill the <password> field with "123456"
#    And I expect the "Submit" button to be enabled
#    When I tap the "Submit" button
#    Then I should see "user not found"
#
#    Examples:
#      | email                               | password                            |
#      | "loginForm_emailInput_textField"    | "loginForm_passwordInput_textField" |
#
#  Scenario Outline: Login successfully
#    Given I am on the login page
#    When I fill the <email> field with "eve.holt@reqres.in"
#    Then I should see "eve.holt@reqres.in"
#    And I expect the "Submit" button to be disabled
#    When I fill the <password> field with "cityslicka"
#    And I expect the "Submit" button to be enabled
#    When I tap the "Submit" button
#    Then I should see home page
#    Examples:
#      | email                               | password                            |
#      | "loginForm_emailInput_textField"    | "loginForm_passwordInput_textField" |
