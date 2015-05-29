module BankAccounts
  require "pry"

  class SavingsAccount < Account

    def initialize(id, initial_balance)

      if initial_balance < 10
        raise ArgumentError.new("You need a minimum of $10 to open this account.")
      else
        @balance = initial_balance
      end

    end

    def withdraw(amount)
      amount += 2
      if (@balance - amount) < 10
        return "Insufficient funds. Please withdraw a smaller amount."
      else
        @balance -= amount
      end
    end
    binding.pry




  end #class

end # module
