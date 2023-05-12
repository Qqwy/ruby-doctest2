# 0.9.0
First release. Contains all the features of `doctest-core`/`doctest-rspec`,
with the following improvements:
- Compile on Ruby 3 and up
- Support for Minitest (as the `doctest2-minitest` gem)
- Only show paths up to the project root folder in test output.
- On test failure, print doctest source code for easier debugging.
- Support for `#=>` at the end of the same line as a code snippet.
