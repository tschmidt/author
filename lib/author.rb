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
require 'liquid'
require 'coderay'
require 'thor'
require 'kramdown'
require 'safe_yaml'

# internals
require 'author/version'
require 'author/utils'
require 'author/configuration'
require_all 'author/commands'
require_all 'author/plugins'
require_all 'author/exporters'

module Author
  
  def self.configuration(override = nil)
    config = Configuration[Configuration::DEFAULTS]
    override = Configuration[override || config.load_override_file || {}].stringify_keys
    config = Utils.deep_merge_hashes(config, override).stringify_keys
    
    config
  end
  
end
