# Encoding: UTF-8
# For use/testing when author gem is not installed
$LOAD_PATH.unshift File.dirname(__FILE__)

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

module Author # rubocop:disable Documentation
  def self.configuration(override = nil)
    config = Configuration[Configuration::DEFAULTS]
    override = Configuration[get_override(override, config)].stringify_keys
    config = Utils.deep_merge_hashes(config, override).stringify_keys

    config
  end

  def self.get_override(override, config)
    override || config.load_override_file || {}
  end
end
