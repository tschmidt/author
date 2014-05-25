module Author
  module Exporters
    class PDF < Base
      # 1. check that prince is installed
      # 2. check that xhtml file exists
      # 3. check that css file exists
      # 4. run prince command
      
      def self.export
        exporter = new
        exporter.prince_installed?
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
      
      def prince_installed?
        raise "Prince XML is not installed. This is required to build PDFs." unless `which prince` && $?.success?
      end
      
      def export
        system("prince -s #{theme_path} #{output_path} -o #{File.join(export_path, 'book.pdf')}")
      end
      
    end
  end
end