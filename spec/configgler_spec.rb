$:.unshift '../lib/' 
require 'configgler'

describe Configgler do 

    describe 'load yaml file' do
        it 'should load a yaml file' do
            c = Configgler.load('configgler_spec.yml', File.dirname(__FILE__), 'yaml')
            c.is_a?(Configgler::Config).should == true
        end
    end 

    describe 'read values' do
        
        it 'should navigate configuration values using list of keys [config.get(\'one\',\'two\',\'three\',\'four\')]' do
            c = Configgler.load('configgler_spec.yml', File.dirname(__FILE__), 'yaml')
            c.get('third','stuff','h1').should == 'foo'
        end

        it 'should navigate configuration values using dot-notation [config.one.two.three.four]' do
            c = Configgler.load('configgler_spec.yml', File.dirname(__FILE__), 'yaml')
            c.third.stuff.h1.should == 'foo'
        end

        it 'should navigate configuration values using mixed notation [config.one.two.get(\'three\',\'four\')]' do
            c = Configgler.load('configgler_spec.yml', File.dirname(__FILE__), 'yaml')
            c.third.get('stuff','h1').should == 'foo'
        end

    end 
end


