package com.flutter_tdd_new.flutter_tdd_new;

import androidx.test.rule.ActivityTestRule;

import dev.flutter.plugins.integration_test.FlutterTestRunner;
import org.junit.Rule;
import org.junit.runner.RunWith;

@RunWith(FlutterTestRunner.class)
public class FlutterActivityTest {
    @Rule
    public ActivityTestRule<MainActivity> rule =
            new ActivityTestRule<>(MainActivity.class, true, false);
}