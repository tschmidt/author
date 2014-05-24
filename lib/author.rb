$:.unshift File.dirname(__FILE__) # For use/testing when author gem is not installed

# Convenience method that will require all files in the given path
def require_all(path)
  glob = File.join(File.dirname(__FILE__), path, '*.rb')
  Dir[glob].each do |file|
    require file
  end
end

# stdlib

# 3rd party

# internals
require 'author/version'

require_all 'author/commands'

module Author
  
end
