require_relative '../helper.rb'
require 'author/commands/version'

describe Author::Commands::Version do
  
  it "should return Author version" do
    output = capture(:stdout) { Author::Commands::Version.start }
    expect(output.chomp).to_equal "Author version #{Author::VERSION}"
  end
  
end