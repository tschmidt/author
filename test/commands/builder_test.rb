require_relative '../helper'
require 'author/commands/builder'

describe Author::Commands::Builder do
  
  let(:builder) { Author::Commands::Builder }
  
  it "should respond to xhtml" do
    output = capture { builder.start }
    expect(output).to_include "xhtml"
  end
  
end