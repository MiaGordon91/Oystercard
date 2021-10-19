require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it 'checks balance has default value of 0' do
    expect(oystercard.balance).to eq Oystercard::DEFAULT_VALUE
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

  describe '#deduct' do 
    it 'deduct method reduces balance by specified amount' do
      oystercard.top_up(50)
      expect(oystercard.deduct(10)).to eq(40)
    end 
  end 

  describe '#in_journey?' do
    it 'returns false, if a card is not in use' do
      expect(oystercard.in_journey?).to eq(false)
    end
  end

  describe '#touch_in' do
    it 'changes a cards status to in use' do
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq(true)
    end
  end

end


