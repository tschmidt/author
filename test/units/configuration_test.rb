require_relative '../helper'
require 'author/configuration'

describe Author::Configuration do
  
  let(:config) { Author::Configuration }
  
  let(:mixed_keys) do
    config[{
      'foo' => 'bar',
      :source => './'
    }]
  end
  
  let(:string_keys) do
    config[{
      'foo' => 'bar',
      'source' => './'
    }]
  end
  
  it "should stringify keys" do
    expect(mixed_keys.stringify_keys).to_equal string_keys
  end
  
  it "should not mess with keys that are already strings" do
    expect(string_keys.stringify_keys).to_equal string_keys
  end
  
  it "should know about override config path" do
    expect(string_keys).to_respond_to :override_config_path
  end
  
  it "should load config file" do
    inside_sample_book do
      expect(string_keys.load_override_file).to_include "eeepub"
    end
  end
  
end