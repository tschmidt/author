require 'safe_yaml/load'

module Author
  class Configuration < Hash
    
    DEFAULTS = {
      'eeepub' => {
        'title'       => nil,
        'creator'     => nil,
        'publisher'   => nil,
        'date'        => nil,
        'identifier'  => nil,
        'uid'         => nil,
        'files'       => [], 
        'nav'         => []
      }
    }
    
    def stringify_keys
      reduce({}) { |hsh, (k,v)| hsh.merge(k.to_s => v) }
    end
    
    def override_config_path
      filepath = File.join(Dir.pwd, 'config.yml')
      File.file?(filepath) ? filepath : nil
    end
    
    def load_override_file
      SafeYAML.load_file(override_config_path) if override_config_path
    end
    
  end
end