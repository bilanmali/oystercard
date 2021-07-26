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

    it { is_expected.to respond_to(:deducts).with(1).argument }
    
    it 'can deduct from the balance' do
    expect{ subject.deducts 1 }.to change{ subject.balance }.by -1
    end
  end

  # it 'is initially not in a journey' do
  #   expect(subject).not_to be_in_journey
  # end

  it "can touch in" do
    oystercard.touch_in
    expect(oystercard.in_journey?).to eq true
  end

  it "can touch out" do 
    oystercard.touch_in
    oystercard.touch_out
    expect(oystercard.in_journey?).to eq false
  end

end
