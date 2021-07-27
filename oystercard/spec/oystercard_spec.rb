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


  it "can touch in" do
    subject.top_up(2)
    oystercard.touch_in
    expect(oystercard.in_journey?).to eq true
  end

  it "can touch out" do 
    #oystercard.touch_in
    oystercard.touch_out
    expect(oystercard.in_journey?).to eq false
  end

  it "does not allow you to touch in with insufficent funds" do
    #min_balance = Oystercard::MIN_BALANCE
    subject.top_up(0.5)
    expect{ subject.touch_in}.to raise_error("insufficient balance" )
  end

  it "when touching out money is deducted from card " do
    oystercard.touch_out
    expect { oystercard.touch_out}.to change{ oystercard.balance}.by(-Oystercard::MIN_BALANCE)
  end

end
