module Bank
  class Account
    attr_accessor :id, :balance

    def initialize(id, initial_balance)
      @id = id
      @balance = initial_balance.to_f >= 0 ? initial_balance.to_f : 0
    end

    def withdraw(amount)
      amount = amount.to_f

      if @balance - amount >= 0
        @balance -= amount
      else
        @balance = 0
      end

      return @balance
    end
  end
end
