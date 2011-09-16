require 'lib/configgy'

describe Configgy do 

    describe '#load' do
        it 'should load a yaml file' do
            c = Configgy.load('configgy_test.yml', File.dirname(__FILE__))
            c.first.should == 1
        end
    end 

end


