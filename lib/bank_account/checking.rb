module Bank
  # inherits from Account class
  class CheckingAccount < Account
    attr_accessor :balance, :day_of_month, :checks_used

    # inherits instance variables from Account class
    def initialize(id, balance)
      super
      # instance variables specific to this class
      @day_of_month = 1
      @checks_used = 0
    end

    # resets checks used to zero
    def reset_checks
      @checks_used = 0
    end

    # subtracts amount from account balance
    # day of month increases with transaction
    # charges $1 for withdrawal
    def withdraw(amount)
      time_passes
      @balance -= (amount + 1)
      # gives error message for withdrawal greater than balance
      # and returns unchanged balance
      if @balance < 0
        puts "Insufficient Funds. Total in checking account: "
        return @balance += (amount + 1)
      else
        return @balance
      end
    end

    # allows withdrawal up to $10 over the remaining balance
    # day of month increases with transaction
    def withdraw_using_check(amount)
      time_passes
      @balance -= amount
      if @balance < -10
        puts "Insufficient Funds. Total in checking account: "
        return @balance += amount
      else
        # adds to amount of checks used within 30 days
        @checks_used += 1
        if @checks_used <= 3
          return @balance
        # charges $2 for over 3 written checks
        else
          return @balance -= 2
        end
      end
    end

    # counts up to 30 days for a month
    # after which it is reset to the first of the month
    # and number of checks used is reset to 0
    def time_passes
      if @day_of_month == 30
        @day_of_month = 1
        reset_checks
      else
        @day_of_month += 1
      end
    end

  end
end
