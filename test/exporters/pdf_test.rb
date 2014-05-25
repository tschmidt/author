require_relative '../helper'
require 'author/exporters/base'
require 'author/exporters/pdf'

describe Author::Exporters::PDF do
  
  let(:exporter) { Author::Exporters::PDF }
  
  it "should respond to #export" do
    expect(exporter).to_respond_to :export
  end
  
  it "should raise error if no book.xhtml file exists" do
    expect { exporter.export }.to_raise RuntimeError
  end
  
  it "should raise error if no book.css file exists" do
    expect { exporter.export }.to_raise RuntimeError
  end
  
  context "an instance" do
    let(:exporter) { Author::Exporters::PDF.new } 
    
    it "should respond to #prince_installed?" do
      expect(exporter).to_respond_to :prince_installed?
    end
    
    it "should respond to #xhtml_exists?" do
      expect(exporter).to_respond_to :xhtml_exists?
    end
    
    it "should respond to #css_exists?" do
      expect(exporter).to_respond_to :css_exists?
    end
    
    it "should respond to #export" do
      expect(exporter).to_respond_to :export
    end
  end
  
end