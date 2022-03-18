.PHONY: rebuild
rebuild:
	flutter pub run build_runner clean && flutter pub run build_runner build --delete-conflicting-outputs

## generate file html report and run on web
.PHONY: integration_test_report
integration_test_report:
	node integration_test/gherkin/reports/index.js

## grun integration_test with emulator (android or ios)
.PHONY: integration_test_device
integration_test_device:
	flutter drive --driver=test_driver/integration_test.dart --target=integration_test/gherkin_suite_test.dart


## run integration_test with chrome default
.PHONY: integration_test_web
integration_test_web:
	flutter drive --driver=test_driver/integration_test.dart --target=integration_test/gherkin_suite_test.dart -d web-server --no-headless

.PHONY: integration_test_web_debug
integration_test_web_debug:
	flutter drive --driver=test_driver/integration_test.dart --target=integration_test/gherkin_suite_test.dart -d chrome --web-renderer html

.PHONY: integration_test_web_demo
integration_test_web_demo:
	flutter drive --web-port 8080 --browser-name=safari --driver=test_driver/driver_test.dart --target=integration_test/demo_test.dart -d chrome --web-renderer html

## run integration_test with safari
.PHONY: integration_test_web_safari
integration_test_web_safari:
	flutter drive --web-port 8080 --browser-name=safari --driver=test_driver/integration_test.dart --target=integration_test/gherkin_suite_test.dart -d web-server --no-headless

## run integration_test with firefox
.PHONY: integration_test_web_firefox
integration_test_web_firefox:
	flutter drive --web-port 8080 --browser-name=firefox --driver=test_driver/integration_test.dart --target=integration_test/gherkin_suite_test.dart -d web-server --no-headless

## run integration_test with edge
.PHONY: integration_test_web_edge
integration_test_web_edge:
	flutter drive --web-port 8080 --browser-name=edge --driver=test_driver/integration_test.dart --target=integration_test/gherkin_suite_test.dart -d web-server --no-headless



## start chrome
.PHONY: driver_start_chrome
driver_start_chrome:
	./scripts/chromedriver --port=4444

## start safari
.PHONY: driver_safari_enabled
driver_safari_enabled:
	sudo safaridriver --enable
.PHONY: driver_start_safari
driver_start_safari:
	/usr/bin/safaridriver --port=4444

## start firefox
.PHONY: driver_install_firefox
driver_install_firefox:
	brew install geckodriver

.PHONY: diriver_start_firefox
diriver_start_firefox:
	geckodriver --port=4444

## start edge only support on windows
.PHONY: driver_start_edge
driver_start_edge:
	./scripts/msedgedriver --port=4444

## run integration_test on real device android
.PHONY: integration_test_real_device_android
integration_test_real_device_android:
	./gradlew app:connectedAndroidTest -Ptarget=`pwd`/../integration_test/gherkin_suite_test.dart --stacktrace --warning-mode=all

## run integration_test on real device ios
.PHONY: integration_test_real_device_ios
integration_test_real_device_ios:
	flutter build ios --config-only integration_test/gherkin_suite_test.dart


## run unit-test
.PHONY: test
test:
	flutter test


.PHONY: install
install:
	yarn add && flutter pub get

.PHONY: clean
clean:
	flutter clean && flutter pub cache clean

.PHONY: coverage
coverage:
	flutter test --coverage

.PHONY: run-web
run-web:
	flutter run -d web-server
