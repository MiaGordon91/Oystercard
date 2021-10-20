require 'station'

describe Station do 

before(:all) do
  @station = Station.new 
end 

  it 'test that the station exposes a station name' do
    expect(@station.name).to eq Station::DEFAULT_STATION
  end 

  it 'test that the station exposes a zone' do
    expect(@station.zone).to eq Station::DEFAULT_ZONE
  end 
end
