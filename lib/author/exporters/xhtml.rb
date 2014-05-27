require 'liquid'
require 'kramdown'
require 'author/plugins/awesome_codeblock'
require 'author/plugins/sidebar'

module Author
  module Exporters
    class XHTML < Base
      # step 1: get file names from the outline.txt file
      # step 2: create a new file called all.md
      # step 3: concatenate all files and output to all.md
      # step 4: run all.md through liquid
      # step 5: run all.md through kramdown with template specified in config
      # step 6: output result of step 5 to `export/book.xhtml`
      # step 7: handle css and images
      
      def self.export
        exporter = new
        exporter.combine_all_files
        exporter.liquify
        exporter.kramdownify
      end
      
      def outline_path
        filepath = File.join(root_dir, 'outline.txt')
        raise "No outline.txt file found. Make sure you are in an author project." unless File.file?(filepath)
        filepath
      end
      
      def file_names
        [].tap do |array|
          File.readlines(outline_path).each do |line|
            array << line.gsub(/\n/, '')
          end
        end
      end
      
      def combined_file_path
        File.join(source_dir, 'all.md')
      end
      
      def layout_path
        File.join(source_dir, '..', 'templates', 'layout.xhtml')
      end
      
      def combine_all_files
        File.open(combined_file_path, 'w') do |file|
          file.puts concatenate_files
        end
      end
      
      def concatenate_files
        ''.tap do |output|
          file_names.each do |file_name|
            filepath = File.join(source_dir, file_name)
            next unless File.file?(filepath)
            output += IO.read(filepath)
            output += "\n\n" unless file_name == file_names.last
          end
          return output
        end
      end
      
      def liquify(assigns = {})
        @assigns = assigns
        liquified_output = Liquid::Template.parse(IO.read(combined_file_path)).render(@assigns)
        File.open(combined_file_path, 'w') do |file|
          file.puts liquified_output
        end
      end
      
      def kramdownify
        kramified_output = Kramdown::Document.new(IO.read(combined_file_path), template: layout_path).to_html
        File.open(output_path, 'w') do |file|
          file.puts kramified_output
        end
      end
      
    end
  end
end