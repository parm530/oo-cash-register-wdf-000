require 'pry'

class CashRegister

  attr_accessor :discount, :total, :last_transaction


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    self.total = self.total + price*quantity
    self.last_transaction = (price*quantity)

    until(quantity == 0)
      @items << item
      quantity -= 1
    end

  end

  def apply_discount
    if(self.discount > 0)
      self.total = (self.total - self.total*(self.discount.to_f/100.0)).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end





