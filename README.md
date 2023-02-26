# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

# Testing best practices

## RSpec
To run RSpec tests:

```bash
# run test for a file
bin/rspec spec/models/project_spec.rb

# run test for the example on line 10 on that file
bin/rspec spec/models/project_spec.rb:10

# run tests matching the example name has that string
bin/rspec spec/models/project_spec.rb -e some_string

# run all tests, will take hours for GitLab codebase!
bin/rspec
```


# Test Plan

- The test cases for the _features issues_ of your application may be placed at _spec/system/ROLE_ACTION_spec.rb_
  - such as _spec/system/user_changes_password_spec.rb_
- Use scenario titles that describe the success and failure paths.
- Avoid scenario titles that add no information, such as "successfully".
- Avoid scenario titles that repeat the feature title.
- Create only the necessary records in the database.
- Test a happy path and a less happy path but that's it.
- Every other possible path should be tested with Unit or Integration tests.
- Test what's displayed on the page, not the internals of ActiveRecord models.
- For instance, if you want to verify that a record was created, add expectations that its attributes are displayed on the page, not that `Model.count` increased by one.
- It's ok to look for DOM elements, but don't abuse it, because it makes the tests more brittle.

# Test Tooling

# Capybara setup

Can't run Rails system test on WSL Ubuntu 18?

- https://stackoverflow.com/questions/56875116/cant-run-rails-system-test-on-wsl-ubuntu-18

## Chrome Driver

- https://sites.google.com/chromium.org/driver/?pli=1

latest stable:
Index of /110.0.5481.77/

### Linux

chromedriver_linux64.zip 2023-02-08 08:07:21 7.05MB ddb02c4f60356edf4f832df472872a44
https://chromedriver.storage.googleapis.com/110.0.5481.77/chromedriver_linux64.zip

### Mac

chromedriver_mac64.zip 2023-02-08 08:07:28 8.82MB 2b6c666b02384e07e0e8b0c122a2f647
https://chromedriver.storage.googleapis.com/110.0.5481.77/chromedriver_mac64.zip

chromedriver_mac_arm64.zip 2023-02-08 08:07:36 8.00MB b0f409e6fb4f12e30b7ecbf44c7280d6
https://chromedriver.storage.googleapis.com/110.0.5481.77/chromedriver_mac_arm64.zip

Enable running permissions
$ xattr -d com.apple.quarantine <path/to/bin/chromedriver>
$ ./path/to/bin/chromedriver

### Windows

Bind chromedriver to 0.0.0.0 instead of 127.0.0.1
and allow connections for WSL2 VM.
$ chromedriver --allowed-ips

chromedriver_win32.zip 2023-02-08 08:07:44 6.78MB 5382dfdd7e76113a3d95e1bb4e43bca7
https://chromedriver.storage.googleapis.com/110.0.5481.77/chromedriver_win32.zip
