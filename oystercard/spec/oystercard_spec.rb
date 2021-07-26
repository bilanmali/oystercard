require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new()}
  it 'has a balance of 0' do
    expect(oystercard.balance).to eq(0)
  end
  
  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    
    it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
    
    it 'raises an error if balance exceeds £90' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect{ subject.top_up 1 }.to raise_error 'Max balance reached'
    end
  end
end
