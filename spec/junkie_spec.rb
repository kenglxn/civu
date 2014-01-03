require "rspec"
require "junkie"

describe "junkie" do

  it "should give feedback if connection details are missing or incorrect " do
    expect { Junkie::Client.new(nil, nil, nil) }.to raise_error
  end

  
end