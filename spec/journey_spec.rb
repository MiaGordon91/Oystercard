require 'journey'
require 'station'


describe Journey do
  before(:all) do
    @new_station = Station.new
    @journey = Journey.new 
  end

context ' Testing entry station' do
  
  it 'testing the journey has a default rspec station' do
    # @new_station.name = 'Baker St'
    expect(@journey.entry_station).to be_a(Station)
  end

  it 'Journey accepts starting station' do
    @new_station.name = 'Baker St'
    @journey.entry_station = @new_station
    expect(@journey.entry_station.name).to eq('Baker St')
  end
end

context 'Testing exit station' do
  it 'The journey acceptes an exit station' do
    @new_station.name = 'Kings Cross'
    @journey.exit_station = @new_station
    expect(@journey.exit_station.name).to eq('Kings Cross')
  end
end

# Calculate Fare


context 'Testing if we are in a journey' do
  it 'If card is in use' do
    @journey = Journey.new
    @new_station.name = 'Kings Cross'
    @journey.entry_station = @new_station
    p @journey
    expect(@journey.in_journey?).to eq(true)
  end
end

end

