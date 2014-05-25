require_relative '../helper'
require 'author/commands/cli'

describe Author::Commands::Cli do
  
  let(:output) do
    capture(:stdout) { Author::Commands::Cli.start }
  end
  
  it "should respond to version" do
    expect(output).to_include "version"
  end
  
  it "should respond to check" do
    expect(output).to_include "check"
  end
  
  it "should respond to new" do
    expect(output).to_include "new"
  end
  
  it "should respond to build" do
    expect(output).to_include "build"
  end

end