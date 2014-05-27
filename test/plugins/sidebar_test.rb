require_relative '../helper'
require 'liquid'
require 'author/plugins/sidebar'

describe Author::Plugins::Sidebar do
  
  let(:liquid) { Liquid::Template }
  
  context "no type specified" do
    it "should process the block into an info sidebar" do
      using_liquid_templates do
        output = liquid.parse(IO.read('sidebar-no-type.txt')).render
        expect(output).to_include %q[<table class="sidebar sidebar-info">]
      end
    end
  end
  
  context "type is specified" do
    %w[info warning tip].each do |type|
      it "should process the block into the correct sidebar" do
        using_liquid_templates do
          output = liquid.parse(IO.read("sidebar-#{type}.txt")).render
          expect(output).to_include %Q[<table class="sidebar sidebar-#{type}">]
          expect(output).to_match %r[I am an? #{type} sidebar]
        end
      end
    end
  end
  
end