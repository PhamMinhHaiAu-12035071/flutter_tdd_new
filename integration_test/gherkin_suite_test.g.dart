// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gherkin_suite_test.dart';

// **************************************************************************
// GherkinSuiteTestGenerator
// **************************************************************************

class _CustomGherkinIntegrationTestRunner extends GherkinIntegrationTestRunner {
  _CustomGherkinIntegrationTestRunner(
    TestConfiguration configuration,
    Future<void> Function(World) appMainFunction,
  ) : super(configuration, appMainFunction);

  @override
  void onRun() {
    testFeature0();
  }

  void testFeature0() {
    runFeature(
      'Login Page:',
      <String>[],
      () {
        runScenario(
          'LoginForm will show error message when field is empty Examples: (1)',
          <String>[],
          (TestDependencies dependencies) async {
            await runStep(
              'Given I am on the login page',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I fill the "loginForm_emailInput_textField" field with "eve.holt@reqres.in"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I should see "eve.holt@reqres.in"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I clear text on the "loginForm_emailInput_textField" field',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I should see "Email is not empty"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I expect the "Submit" button to be disabled',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I fill the "loginForm_passwordInput_textField" field with "123456"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I clear text on the "loginForm_passwordInput_textField" field',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I should see "Password is not empty"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I expect the "Submit" button to be disabled',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: () async => onBeforeRunFeature(
            'Login Page',
            <String>[],
          ),
        );

        runScenario(
          'LoginForm with field valid Examples: (1)',
          <String>[],
          (TestDependencies dependencies) async {
            await runStep(
              'Given I am on the login page',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I fill the "loginForm_emailInput_textField" field with "eve.holt@reqres.in"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I should see "eve.holt@reqres.in"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I expect the "Submit" button to be disabled',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I fill the "loginForm_passwordInput_textField" field with "123456"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I expect the "Submit" button to be enabled',
              <String>[],
              null,
              dependencies,
            );
          },
          onAfter: () async => onAfterRunFeature(
            'Login Page',
          ),
        );
      },
    );
  }
}

void executeTestSuite(
  TestConfiguration configuration,
  Future<void> Function(World) appMainFunction,
) {
  _CustomGherkinIntegrationTestRunner(configuration, appMainFunction).run();
}
