module Author
  module Exporters
    class Mobi < Base
      # 1. check that kindlegen is installed
      # 2. check that xhtml file exists
      # 3. run kindlegen command
      
      def self.export
        exporter = new
        exporter.kindlegen_installed?
        exporter.xhtml_exists?
        exporter.export
      end
      
      def xhtml_exists?
        raise "No book.xhtml file found" unless File.file?(output_path)
      end
      
      def kindlegen_installed?
        raise "KindleGen is not installed. This is required to build .mobi files." unless `which kindlegen` && $?.success?
      end
      
      def export
        system("kindlegen #{output_path}")
      end
      
    end
  end
end