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
    client.list('test_view').should eq(%w(git@server:fizz/buzz git@server:foo))
  end

  it 'should clone all urls in view preserving paths' do
    client = Junkie::Client.new('http://localhost:8080', 'admin', 'admin')
    client.executor.stub(:run => true)
    client.clone('test_view')
    expect(client.executor).to have_received(:run).with('git clone git@server:fizz/buzz fizz/buzz')
    expect(client.executor).to have_received(:run).with('git clone git@server:foo foo')
  end
end