require 'thor'

module Author
  module Commands
    class Check < Thor::Group
      
      def check_for_prince
        check_for "Prince"
      end
      
      def check_for_kindlegen
        check_for "KindleGen"
      end
      
      private
      
      def check_for(dependency)
        command = dependency.downcase
        installed = (`which #{command}` && $?.success?)
        color = installed ? :green : :red
        say "Checking for #{dependency}"
        say "#{dependency} is#{' not' unless installed} installed\n\n", color
      end
      
    end
  end
end