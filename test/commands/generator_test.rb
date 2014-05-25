require_relative '../helper'
require 'author/commands/generator'

describe Author::Commands::Generator do
  
  it "should require a name" do
    output = capture(:stderr) { Author::Commands::Generator.start }
    expect(output).to_include "No value provided for required arguments 'name'"
  end
  
  it "should create project structure" do
    play_in_sandbox do
      capture(:stdout) { Author::Commands::Generator.start ['abook'] }
      
      'abook'.must_be_a_directory
      'abook/chapters'.must_be_a_directory
      'abook/export'.must_be_a_directory
      'abook/templates'.must_be_a_directory
    end
  end
  
  it "should create project files" do
    play_in_sandbox do
      capture { Author::Commands::Generator.start ['ihazfiles']}
      
      'ihazfiles/config.yml'.must_be_a_file
      'ihazfiles/Gemfile'.must_be_a_file
      'ihazfiles/outline.txt'.must_be_a_file
      'ihazfiles/chapters/sample.md'.must_be_a_file
      'ihazfiles/templates/layout.xhtml'.must_be_a_file
    end
  end
  
  it "should run bundler for the new project" do
    play_in_sandbox do
      output = capture(:stdout) { Author::Commands::Generator.start ['bundled'] }
      expect(output).to_include "Bundling gems"
    end
  end
  
end