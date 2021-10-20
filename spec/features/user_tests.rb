require '../../lib/oystercard'

describe 'user testing' do

# In order to use public transport
# As a customer
# I want money on my card

it 'check if money is on the card' do
  it 'checks balance has default value of 0' do
  oystercard = Oystercard.new
  expect(oystercard.balance).to eq Oystercard::DEFAULT_VALUE
end
 
# In order to keep using public transport
# As a customer
# I want to add money to my card

it 'adds top up value to the balance of the card' do
  oystercard = Oystercard.new
  # oystercard.top_up(20)
  expect(oystercard).to respond_to(:top_up).with(1).argument
end

# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

it 'raises an error if top_up takes balance beyond limit' do 
  oystercard = Oystercard.new
  expect{ oystercard.top_up 100}.to raise_error 'Maximum limit exceeded'
end 

end 