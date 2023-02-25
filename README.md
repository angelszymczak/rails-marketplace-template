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
