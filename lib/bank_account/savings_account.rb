module BankAccount


  class SavingsAccount < Account

    def initialize(id, initial_balance)

      #Inherit the same variables as Account
      # I realize that I'll also inherit the same negative balance
      # conditional. However, that's intentional.
      super

      # Warning if balance is under 10
      if @initial_balance < 10
        raise ArgumentError, "You can't have less than 10 whole bucks!"
      end
    end

    # Gets monies from account, updates current balance
    def withdraw(get_monies)

      # All of this behavior is unique. So I
      # don't think I can call super...
      highway_robbery = 2
      total_withdraw = get_monies + highway_robbery

      # Proceeds if you have enough monies
      if @current_balance - total_withdraw > 10
        @current_balance -= total_withdraw
      else
        # Yells at you (nicely) if you don't have enough monies
        return "Sorry, you need a minimum of ten whole bucks in your account. Withdraw canceled. Let's keep your current balance at #{@current_balance}."
      end
    end

    # Calculates and displays the interest
    def add_interest(rate)
      interest = @current_balance * (rate/100)
      return "$#{interest}"
    end

  end #class
end #module
