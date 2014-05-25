module Author
  module Exporters
    class Base
      
      def root_dir
        Dir.pwd
      end
      
      def source_dir
        File.join(root_dir, 'chapters')
      end
      
      def export_path
        File.join(source_dir, '..', 'export')
      end
      
      def output_path
        File.join(export_path, 'book.xhtml')
      end
      
      def theme_path
        File.join(export_path, 'book.css')
      end
      
    end
  end
end