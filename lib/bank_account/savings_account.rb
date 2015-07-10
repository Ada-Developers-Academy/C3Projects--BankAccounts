module BankAccount


  class SavingsAccount < Account

    def initialize(id, balance)

      #Inherit the same variables as Account
      # I realize that I'll also inherit the same negative balance
      # conditional. However, that's intentional.
      super

      # Warning if balance is under 10
      if @balance < 10
        raise ArgumentError, "You can't have less than 10 whole bucks!"
      end
    end

    # Gets monies from account, updates current balance
    def withdraw(amount)

      highway_robbery = 2 #That yucky fee
      total_withdraw = amount + highway_robbery

      # Proceeds if you have enough monies
      if @balance - total_withdraw > 10
        @balance -= total_withdraw
      else
        # Yells at you (nicely) if you don't have enough monies
        return "Sorry, you need a minimum of ten whole bucks in your account. Withdraw canceled. Let's keep your current balance at #{@balance}."
      end
    end

    # Calculates and displays the interest
    def add_interest(rate)
      interest = @balance * (rate/100)
      @balance += interest
      return "$#{interest}"
    end

  end #class
end #module
