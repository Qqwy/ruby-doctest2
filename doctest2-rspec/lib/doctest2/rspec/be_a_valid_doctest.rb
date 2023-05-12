::RSpec::Matchers.define :be_a_valid_doctest do |expected|
  match do |actual|
    actual.code_evaluation == actual.result_evaluation
  end

  failure_message do |actual|
    "\nexpected: #{actual.result_evaluation}\n     got: #{actual.code_evaluation}\n\n(compared using ==)\n\nWhile running doctest: \n\t#{actual.code_string}\n"
  end
end
