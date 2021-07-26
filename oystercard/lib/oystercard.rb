class Oystercard 
    
    MAX_BALANCE = 90
    
  attr_reader :balance
    
  def initialize
    @balance = 0
    @in_journey = nil
  end
  
  def top_up(amount)
    fail 'Max balance reached' if amount + @balance > MAX_BALANCE
    @balance += amount
  end

  def deducts(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end