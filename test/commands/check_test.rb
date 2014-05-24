require_relative '../helper'
require 'author/commands/check'

describe Author::Commands::Check do
  
  let(:output) { capture { Author::Commands::Check.start } }
  
  it "should check to see if Prince XML is installed" do
    expect(output).to_include "Checking for Prince"
    expect(output).to_match /^Prince is( not)? installed/
  end
  
  it "should check to see if KindleGen is installed" do
    expect(output).to_include "Checking for KindleGen"
    expect(output).to_match /^KindleGen is( not)? installed/
  end

end