require_relative '../helper'
require 'author/commands/cli'

describe Author::Commands::Cli do
  
  it "should respond to version" do
    output = capture(:stdout) { Author::Commands::Cli.start }
    expect(output).to_include "version"
  end

end