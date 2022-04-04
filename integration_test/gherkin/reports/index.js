import reporter from "cucumber-html-reporter";

var options = {
  theme: "bootstrap",
  jsonDir: "integration_test/gherkin/reports/gen",
  output: "integration_test/gherkin/reports/cucumber_report.html",
  reportSuiteAsScenarios: true,
  scenarioTimestamp: true,
  launchReport: true,
  ignoreBadJsonFile: true,
  metadata: {
    "App Version": "0.3.2",
    "Test Environment": "DEV",
    Browser: "Chrome  54.0.2840.98",
    Platform: "Mac OS",
    Parallel: "Scenarios",
    Executed: "Remote",
  },
};

reporter.generate(options);
