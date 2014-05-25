require 'minitest'
require 'minitest/autorun'
require 'minitest/spec/expect'
require 'minitest/pride'
require_relative 'utils/assertions'

module AuthorHelpers
  include FileUtils
  
  def capture(stream = :stdout)
    begin
      strm = stream.to_s
      eval "$#{strm} = StringIO.new"
      yield
      result = eval("$#{strm}").string
    ensure
      eval("$#{strm} = #{strm.upcase}")
    end
    result
  end
  
  def sandbox_path
    File.join(File.dirname(__FILE__), 'sandbox')
  end
  
  def play_in_sandbox
    ensure_sandbox_is_clean
    cd(sandbox_path) do
      yield
    end
    empty_sandbox
  end
  
  def ensure_sandbox_is_clean
    rm_rf(sandbox_path)
    mkdir_p(sandbox_path)
  end
  
  def empty_sandbox
    rm_rf(sandbox_path)
  end
  
  def liquid_templates_path
    File.join(File.dirname(__FILE__), 'liquids')
  end
  
  def using_liquid_templates
    cd(liquid_templates_path) do
      yield
    end
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