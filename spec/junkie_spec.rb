require 'rspec'
require 'junkie'

describe 'Junkie' do

  it 'should give feedback if connection details are missing or incorrect ' do
    expect { Junkie::Client.new(nil) }.to raise_error
  end

  it 'should connect to jenkins on client init' do
    Junkie::Client.new('http://localhost:8080')
  end

  it 'should list all repos based on view name' do
    client = Junkie::Client.new('http://localhost:8080', 'admin', 'admin')
    client.list('test_view').should eq(['foo'])
  end
end