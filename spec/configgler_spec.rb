$:.unshift '../lib/' 
require 'configgler'

describe Configgler do 

    describe '#load' do
        it 'should load a yaml file' do
            c = Configgler.load('configgy_test.yml', File.dirname(__FILE__))
            c.first.should == 1
        end
    end 

end


