require 'yaml'

module Configgler

    class Config
        
        attr_accessor :config

        def initialize(file,*args)
            @config = YAML.load(File.new(File.join(args.flatten.join('/'),file)))
        end

        def method_missing(name,*args)
            el = ConfigElement.new(@config,name.to_s)
            el.is_a?(Hash) ? el : el.value
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
                el.is_a?(Hash) ? el : el.value
            end

            def value
                @element
            end

        end

    end

end
