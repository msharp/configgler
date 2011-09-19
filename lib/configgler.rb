"""
nicer api to get data from the yaml configuration files

usage example =>
    c = Configgler.load('config.yml','./')
    puts c.smtp.host
OR
    puts c.get(:smtp,:host)
TODO : handle existing object methods (type,id,class)
"""
module Configgler
    
    require "configgler/version"
    require "configgler/config"

    def self.load(file,*args)
        Configgler::Config.new(file,args)
    end

end
