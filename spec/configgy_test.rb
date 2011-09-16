require '../lib/configgy'

describe Configgler do 

    describe '#load' do
        it 'should load a yaml file' do
            c = Configgler.new('configgy_test.yml', File.dirname(__FILE__))
            c.first.should == 1
        end
    end 

end


