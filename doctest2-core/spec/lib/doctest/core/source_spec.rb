require 'spec_helper'
require fixture('simple_class.rb')
require fixture('simple_class_reopened.rb')
require fixture('simple_module.rb')

module Doctest2::Core
  describe 'Source' do

    context 'to_code_locations' do

      it 'wraps a filename in an array' do
        expect(Source.to_filenames(fixture('simple_file.rb'))).to eql [ fixture('simple_file.rb') ]
      end

      it 'resolves the filenames of a ruby class' do
        expect(Source.to_filenames(SimpleClass)).to eql [
          fixture('simple_class.rb'),
          fixture('simple_class_reopened.rb')
        ]
      end

      it 'resolves the filenames of a ruby module' do
        expect(Source.to_filenames(SimpleModule)).to eql [
          fixture('simple_module.rb'),
        ]
      end

    end

  end
end
