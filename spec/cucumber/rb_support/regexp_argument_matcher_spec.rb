require 'spec_helper'
require 'cucumber/rb_support/regexp_argument_matcher'

module Cucumber
  module RbSupport
    describe RegexpArgumentMatcher do
      include RSpec::WorkInProgress

      it "creates 2 arguments" do
        arguments = RegexpArgumentMatcher.arguments_from(/I (\w+) (\w+)/, "I like fish")
        arguments.map{|argument| [argument.val, argument.offset]}.should == [["like", 2], ["fish", 7]]
      end

      it "creates 2 arguments when first group is optional" do
        arguments = RegexpArgumentMatcher.arguments_from(/should( not)? be flashed '([^']*?)'$/, "I should be flashed 'Login failed.'")
        arguments.map{|argument| [argument.val, argument.offset]}.should == [[nil, nil], ["Login failed.", 21]]
      end
    end
  end
end
