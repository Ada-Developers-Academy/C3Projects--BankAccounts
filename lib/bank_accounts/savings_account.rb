module BankAccounts
  require "pry"

  class SavingsAccount < Account

    def initialize(id, initial_balance)
      super
      # require a minimum opening balance of $10
      if initial_balance < 10
        raise ArgumentError.new("You need a minimum of $10 to open this account.")
      else
        @balance = initial_balance
      end

    end

    def withdraw(amount)
      # every withdraw incurs $2 fee ('cause banks)
      # balance must remain at $10 min
      amount += 2
      if (@balance - amount) < 10
        puts "Insufficient funds. Please withdraw a smaller amount."
        return @balance
      end
      super
    end

    def add_interest(rate)
      # returns error if rate is set at negative
      if rate < 0
        return "Rate must be a positive percentage."
      end

      rate /= 100

      interest_accrued = @balance * rate
      @balance += interest_accrued

      return interest_accrued
    end
  end #class
end # module
