"""
nicer api to get data from the yaml configuration files

usage example =>
    c = Configgy.load('config.yml','./')
    puts c.smtp.host
OR
    puts c.get(:smtp,:host)
TODO : handle existing object methods (type,id,class)
"""

require "configgy/version"
require "configgy/config"
require 'yaml'

module Configgy
    
    def self.load(file,*args)
        Config.new(file,args)
    end

end
=begin
c = Configgy.load('config.yml','./conf')
puts c.smtp.test.type.value
puts c.get(:smtp,:test,:type)
=end
