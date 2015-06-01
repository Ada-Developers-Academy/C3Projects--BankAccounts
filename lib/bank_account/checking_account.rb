require "pry"

module BankAccount

  class CheckingAccount < Account

    # This is unique to the checking account
    attr_accessor :free_checks

    def initialize(id, initial_balance)
      super
      @free_checks = 3 #Per month
    end

    # Get monies
    def withdraw(amount)

      slight_burglary = 1 #That yucky fee
      total_withdraw = amount + slight_burglary

      # Proceeds if you have enough monies
      if @current_balance - total_withdraw > 0
        @current_balance -= total_withdraw
      else
        # Yells at you (nicely) if you don't have enough monies
        return "Sorry, you can't have a negative balance in your account! Withdraw canceled. Let's keep your current balance at #{@current_balance}."
      end
    end

    def withdraw_using_check(amount)
      highway_robbery = 2 #Yucky fee
      total_withdraw = amount + highway_robbery

      # Reduces free checks by one, complete the transaction
      if @current_balance - amount >= -10 && free_checks > 0
        @free_checks -= 1
        @current_balance -= amount
      # Adds that yucky fee when there are no free checks
      elsif @current_balance - amount >= -10 && free_checks == 0
        @current_balance -= total_withdraw
      # Yells at you (nicely) when your balance goes under -$10
      else
        return "Sorry, you can't overdraft more than $10! Withdraw canceled. Let's keep your current balance at #{@current_balance}."
      end
    end

    def reset_checks
      @free_checks = 0
    end

  end #class
end #module
