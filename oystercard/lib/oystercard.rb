class Oystercard 
    
    MAX_BALANCE = 90
    
  attr_reader :balance
    
  def initialize
    @balance = 0
  end
  
  def top_up(amount)
    fail 'Max balance reached' if amount + @balance > MAX_BALANCE
    @balance += amount
  end

  def deducts(amount)
    @balance -= amount
  end

  def in_journey?
    false
  end

  def touch_in
    in_journey?
    return true
  end

  def touch_out
  end

end