import 'given_on_the_page.dart';
import 'i_fill_with_value.dart';
import 'then_expect_state_button.dart';
import 'then_i_should_see.dart';
import 'then_i_should_see_page.dart';
import 'when_i_clear_text_field.dart';
import 'when_i_tap_button.dart';
import 'when_pause_time.dart';

///
/// As a team, go through your user stories and write BDD scenarios using the
/// keywords GIVEN, WHEN, and THEN (AND, BUT can be used as well)
// GIVEN is your setup; for example, "GIVEN the credit card is valid"
// WHEN is your action; for example, "WHEN I request $50"
// THEN, AND, BUT is your assertion; for example,
// "THEN the ATM should dispense $50"

final steps = [
  whenPauseTime,
  thenIShouldSee,
  givenOnThePage,
  thenExpectStateButton,
  whenIClearTextField,
  whenITapButton,
  thenIShouldSeePage,
  whenFillWithValue,
];
