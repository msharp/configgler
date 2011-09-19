$:.unshift '../lib/' 
require 'configgler'

describe Configgler do 

    describe '#load' do
        it 'should load a yaml file' do
            c = Configgler.load('configgler_spec.yml', File.dirname(__FILE__), 'yaml')
            c.is_a?(Configgler::Config).should == true
        end
    end 

    describe 'read values' do
        
        it 'should navigate configuration values using list of keys' do
            c = Configgler.load('configgler_spec.yml', File.dirname(__FILE__), 'yaml')
            c.get('third','stuff','h1').should == 'foo'
        end

        it 'should navigate configuration values using dot-notation' do
            c = Configgler.load('configgler_spec.yml', File.dirname(__FILE__), 'yaml')
            c.third.stuff.h1.should == 'foo'
        end

    end 
end


