"""
nicer api to get data from the yaml configuration files

usage example =>
    c = Configgy.new('config.yml','./')
    puts c.smtp.host.value
OR
    puts c.get(:smtp,:host)
TODO : handle existing object methods (type,id,class)
"""

require "configgy/version"
require 'yaml'

class Configgy
    
    attr_accessor :config

    def initialize(file,*args)
        @config = YAML.load(File.new(File.join(args.join(','),file)))
    end

    def method_missing(name,*args)
        ConfigElement.new(@config,name) 
    end

    def get_by_array(args=[])
        c = @config[args.shift.to_s] 
        until args.length == 0 
            c = c[args.shift.to_s]
        end
        c
    end

    def get(*args)
        get_by_array(args)
    end

    class ConfigElement

        attr_accessor :element

        def initialize(config,element)
            @element = config[element.to_s]
            self
        end

        def method_missing(name)
            el = ConfigElement.new(@element,name.to_s)
            if el.is_a?(Hash)
               el 
            else
                el.value
            end
        end

        def value
            @element
        end

    end

end

=begin
c = Configgy.new('config.yml','./conf')
puts c.smtp.test.type.value
puts c.get(:smtp,:test,:type)
=end
