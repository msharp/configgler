require 'yaml'

module Configgler

    class Config
        
        attr_accessor :config

        def initialize(file,*args)
            @config = YAML.load(File.new(File.join(args.flatten.join('/'),file)))
        end

        def method_missing(name,*args)
            el = ConfigElement.new(@config,name.to_s)
            el.element.is_a?(Hash) ? el : el.value
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

            def method_missing(name,*args)
                el = ConfigElement.new(@element,name.to_s)
                if el.element.is_a?(Hash) 
                    args.length > 0 ? get_by_array(args,el.element) : el 
                else
                    el.element
                end
            end
           
            def value
                @element
            end
        
            def get_by_array(args)
                c = @element[args.shift.to_s] 
                until args.length == 0 
                    c = c[args.shift.to_s]
                end
                c
            end

            def get(*args)
                get_by_array(args)
            end

        end

    end

end
