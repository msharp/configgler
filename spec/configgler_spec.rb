$:.unshift '../lib/' 
require 'configgler'

describe Configgler do 

    describe '#load' do
        it 'should load a yaml file' do
            c = Configgler.load('configgler_spec.yml', File.dirname(__FILE__), 'yaml')
            c.first.should == 1
        end
    end 

end


