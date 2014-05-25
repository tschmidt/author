require_relative '../helper'
require 'author/exporters/xhtml'

describe Author::Exporters::XHTML do
  
  let(:exporter) { Author::Exporters::XHTML.new }
  
  it "should return a list of files" do
    inside_sample_book do
      expect(exporter.file_names).to_equal ['one.md', 'two.md', 'three.md']
    end
  end
  
  it "should combine the files" do
    inside_sample_book do
      expect(exporter.concatenate_files).to_include %q[## This is chapter one]
      expect(exporter.concatenate_files).to_include %q[## This is chapter two]
      expect(exporter.concatenate_files).to_include %q[## This is chapter three]
    end
  end
  
  it "should create a file called all.md" do
    inside_sample_book do
      exporter.combine_all_files
      'chapters/all.md'.must_be_a_file
      output = IO.read('chapters/all.md')
      expect(exporter.concatenate_files).to_include %q[## This is chapter one]
      expect(exporter.concatenate_files).to_include %q[## This is chapter two]
      expect(exporter.concatenate_files).to_include %q[## This is chapter three]
    end
  end
  
  it "should parse liquid" do
    inside_sample_book do
      exporter.combine_all_files
      exporter.liquify({"foo" => "foo output"})
      output = IO.read('chapters/all.md')
      expect(output).to_include "Liquid test foo output"
    end
  end
  
  it "should parse kramdown" do
    inside_sample_book do
      exporter.combine_all_files
      exporter.kramdownify
      output = IO.read('export/book.xhtml')
      expect(output).to_include %q[<h2 id="this-is-chapter-one">This is chapter one</h2>]
    end
  end
  
  it "should create book.xhtml" do
    inside_sample_book do
      Author::Exporters::XHTML.export
      'export/book.xhtml'.must_be_a_file
    end
  end
  
end