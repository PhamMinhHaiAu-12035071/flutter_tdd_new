#!/bin/bash -e

cd android/
./gradlew app:connectedAndroidTest \
		-Ptarget=$(PWD)/../integration_test/gherkin_suite_test_develop.dart -i

sleep 1
cd ../
