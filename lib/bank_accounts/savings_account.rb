module BankAccounts
  class SavingsAccount < Account
    attr_accessor :id, :balance

    def initialize(id, initial_balance)
      raise ArgumentError.new("Must have minimum balance of $10") if initial_balance < 10
      super
    end

    def withdraw(amount)
      if (@balance - amount - 2) < 10
        puts "Insufficient funds. Balance cannot be below $10."
        return @balance
      else
        @balance -= (amount + 2)
      end
    end

    def add_interest(rate)
      interest_on_balance = @balance * rate/100
      @balance += interest_on_balance

      return interest_on_balance
    end

  end
end
