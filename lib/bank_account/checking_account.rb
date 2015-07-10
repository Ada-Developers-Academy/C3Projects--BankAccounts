require "pry"

module BankAccount

  class CheckingAccount < Account

    # This is unique to the checking account
    attr_accessor :free_checks

    def initialize(id, balance)
      super
      @free_checks = 3 #Per month
    end

    # Get monies
    def withdraw(amount)

      slight_burglary = 1 #That yucky fee
      total_withdraw = amount + slight_burglary

      # Proceeds if you have enough monies
      if @balance - total_withdraw > 0
        @balance -= total_withdraw
      else
        # Yells at you (nicely) if you don't have enough monies
        return @balance
      end
    end

    def withdraw_using_check(amount)
      highway_robbery = 2 #Yucky fee
      total_withdraw = amount + highway_robbery

      # Resetting @free_checks to 3 each subsequent month
      # Grabs the calendar month when a check is first used for withdraw
      first_time_use = Time.new.month
      # Sets an "alarm" for next month
      next_month = first_time_use + 1
      # Runs a check
      if Time.now.month == next_month
        @free_checks = 3
      end
      # I don't think this works the way I want it to.
      # I also can't think of how to do the rspec for this.

      # Reduces free checks by one, complete the transaction
      if @balance - amount >= -10 && free_checks > 0
        @free_checks -= 1
        @balance -= amount
      # Adds that yucky fee when there are no free checks
      elsif @balance - amount >= -10 && free_checks == 0
        @balance -= total_withdraw
      # Yells at you (nicely) when your balance goes under -$10
      else
        return @balance
      end
    end

    def reset_checks
      @free_checks = 0
    end

  end #class
end #module
