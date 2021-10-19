require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let (:station) { double(name: :Kings_Cross) }

  it 'checks balance has default value of 0' do
    expect(oystercard.balance).to eq Oystercard::DEFAULT_VALUE
  end 

  it 'has an empty list of journeys by default' do
    expect(oystercard.journeys).to eq [] 
  end

  describe '#top_up' do 

  it { is_expected.to respond_to(:top_up).with(1).argument }
  
  it 'can top up balance with credit' do
    expect { oystercard.top_up 20 }.to change{ oystercard.balance }.by 20   
  end

  it 'raises an error if top_up takes balance beyond limit' do 
    max_limit = Oystercard::MAXIMUM_LIMIT
    oystercard.top_up(max_limit)
    expect { oystercard.top_up 5 }.to raise_error "Maximum limit" + max_limit.to_s + "exceeded"
  end 
end

  describe '#in_journey?' do
    it 'returns false, if a card is not in use' do
      expect(oystercard.in_journey?).to eq(false)
    end
  end

  describe '#touch_in' do
    
    it 'changes a cards status to in use' do
      oystercard.top_up(10)
      oystercard.touch_in(station.name)
      expect(oystercard).to be_in_journey
    end

    it 'raises an error message if balance is less than £1' do
      expect{ oystercard.touch_in(station.name) }.to raise_error "You have insufficient funds"
    end

    it 'saves the entry station on touch in' do
      oystercard.top_up(10)
      oystercard.touch_in(station.name)
      expect(oystercard.entry_station).to eq(:Kings_Cross)
    end 
  
  end

  describe '#touch_out' do

    it 'changes a cards status to NOT in use' do
      oystercard.top_up(10)
      oystercard.touch_in(station.name)
      oystercard.touch_out
      expect(oystercard.in_journey?).to eq(false)
    end

    it 'deducts the minimum' do 
      oystercard.top_up(10)
      oystercard.touch_in(station.name)
      expect { oystercard.touch_out }.to change { oystercard.balance }.by -1
    end

    it 'Makes the card forget entry station' do
      oystercard.top_up(10)
      oystercard.touch_in(station.name)
      oystercard.touch_out 
      expect(oystercard.entry_station).to eq(nil)
    end 

  end

end


