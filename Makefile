help:
	./scripts/utilities.sh

.PHONY: install
install:
	yarn && flutter pub get && chmod u+x ./scripts/chmod.sh

.PHONY: upgrade
upgrade:
	flutter update-packages --force-upgrade

.PHONY: rebuild
rebuild:
	flutter pub run build_runner clean && flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: clean
clean:
	flutter clean && flutter pub cache clean

.PHONY: web-server
web-server:
	flutter run -d web-server

.PHONY: web
web:
	flutter run -d chrome

.PHONY: test
test:
	flutter test

.PHONY: coverage
coverage:
	flutter test --coverage

.PHONY: integration_test_device
integration_test_device:
	flutter drive --driver=test_driver/integration_test.dart \
	--target=integration_test/gherkin_suite_test.dart

.PHONY: integration_test_real_device_android
integration_test_real_device_android:
	./scripts/run_android.sh

.PHONY: integration_test_real_device_ios
integration_test_real_device_ios:
	flutter build ios --config-only integration_test/gherkin_suite_test.dart \
	&& sleep 1 \
	&& open ios/Runner.xcworkspace

.PHONY: integration_test_report
integration_test_report:
	node integration_test/gherkin/reports/index.js

.PHONY: integration_test_web_chrome
integration_test_web_chrome:
	./scripts/check_driver.sh -d 'chromedriver' \
	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
	&& flutter drive --web-port 8080 --browser-name=chrome \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_chrome_debug
integration_test_web_chrome_debug:
	./scripts/check_driver.sh -d 'chromedriver' \
	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
	&& flutter drive --web-port 8080 --browser-name=chrome \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test.dart -d chrome --web-renderer html \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_safari
integration_test_web_safari:
	sudo safaridriver --enable \
	&& ./scripts/new_tab.sh -e '/usr/bin/safaridriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--browser-name=safari --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_firefox
integration_test_web_firefox:
	./scripts/check_driver.sh -d 'geckodriver' \
	&& ./scripts/new_tab.sh -e 'geckodriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--browser-name=firefox --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test.dart -d web-server --no-headless \
	&& sleep 2 \
    && ./scripts/close_tab.sh

