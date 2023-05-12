module Doctest2::RSpec::DoctestHelpers
  def doctest(source)
    context "doctests for #{source}" do
      Doctest2::Core.extract_from(source).each do |doctest|
        file_location = Pathname.new(doctest.original_file).relative_path_from(Pathname.pwd)

        it "at #{file_location}:#{doctest.line}" do
          expect(doctest).to be_a_valid_doctest
        end
      end
    end
  end
end
