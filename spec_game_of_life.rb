#spec file

require 'rspec'
require_relative './lib/world.rb'

describe 'World' do
	subject { World.new }
	
	it 'should create a new world subject' do
		subject.is_a?(World).should be_true
	end

	it 'should respond to proper methods' do 
		subject.should respond_to(:rows)
		subject.should respond_to(:cols)
		subject.should respond_to(:cell_grid)
	end

end