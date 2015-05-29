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
        return "Insufficient funds. Please withdraw a smaller amount."
      end
      super
    end

    def add_interest(rate)
      rate /= 100

      interest_accrued = @balance * rate
      @balance += interest_accrued

      return interest_accrued
    end

    binding.pry



  end #class

end # module
