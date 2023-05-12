setup_and_test: setup test

setup:
  just doctest2-core/setup
  just doctest2-rspec/setup
  just doctest2-minitest/setup

test:
  just doctest2-core/test
  just doctest2-rspec/test
  just doctest2-minitest/test

install:
  just doctest2-core/install
  just doctest2-rspec/install
  just doctest2-minitest/install

release:
  just doctest2-core/release
  just doctest2-rspec/release
  just doctest2-minitest/release