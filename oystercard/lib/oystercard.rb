class Oystercard 
    MAX_BALANCE = 90
    MIN_BALANCE = 1
  
  
    
  attr_reader :balance
    
  def initialize
    @balance = 0
    @in_journey = nil
  end
  
  def top_up(amount)
    fail 'Max balance reached' if amount + @balance > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "insufficient balance" if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out()
    deducts(MIN_BALANCE)
    @in_journey = false
  end
  
  private

def deducts(amount)
  @balance -= amount
end

end