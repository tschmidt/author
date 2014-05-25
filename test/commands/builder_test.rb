require_relative '../helper'
require 'author/commands/builder'

describe Author::Commands::Builder do
  
  let(:builder) { Author::Commands::Builder }
  let(:output) { capture { builder.start } }
  
  it "should respond to xhtml" do
    expect(output).to_include "xhtml"
  end
  
  it "should respond to pdf" do
    expect(output).to_include "pdf"
  end
  
  it "should respond to mobi" do
    expect(output).to_include "mobi"
  end
  
end