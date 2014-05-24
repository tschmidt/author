require 'minitest'
require 'minitest/autorun'
require 'minitest/spec/expect'
require 'minitest/pride'

module AuthorHelpers
  
  def capture(stream = :stdout)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end
    result
  end
  
end
MiniTest::Test.send :include, AuthorHelpers

module MiniTest
  class Spec
    class << self
      alias_method :context, :describe
    end
  end
end