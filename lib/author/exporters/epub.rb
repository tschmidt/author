require 'eeepub'

module Author
  module Exporters
    class Epub < Base
      # 1. check that xhtml file exists
      # 2. check that css file exists
      # 3. create epub
      
      def self.export
        exporter = new
        exporter.xhtml_exists?
        exporter.css_exists?
        exporter.export
      end
      
      def xhtml_exists?
        raise "No book.xhtml file found" unless File.file?(output_path)
      end
      
      def css_exists?
        raise "No book.css file found" unless File.file?(theme_path)
      end
      
      def export
        c = config
        f = [output_path, theme_path]
        epub = EeePub.make do
          title       c['title']
          creator     c['creator']
          publisher   c['publisher']
          date        c['date']
          identifier  c['identifier'], :scheme => 'URL'
          uid         c['uid']
          files       f
        end
        epub.save(File.join(export_path, 'book.epub'))
      end
      
      def config
        Author.configuration.fetch('eeepub')
      end
      
    end
  end
end