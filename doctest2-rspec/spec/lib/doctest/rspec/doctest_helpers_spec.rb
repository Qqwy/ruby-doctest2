require 'spec_helper'
require 'open3'

describe 'doctest helper methods' do
  it 'performs tests' do
    stdout_str, stderr_str, status = Open3.capture3('rspec spec/fixtures/specfile_with_doctests.rb')
    expect(stderr_str).to be_empty
    expect(stdout_str.lines).to include("1 example, 1 failure\n")
    expect(status.exitstatus).to equal 1
  end
end
