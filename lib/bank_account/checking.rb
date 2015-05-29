module Bank
  class CheckingAccount < Account
    attr_accessor :balance, :day_of_month, :checks_used

    def initialize(id, balance)
      super
      @day_of_month = 1
      @checks_used = 0
    end

    def reset_checks
      @checks_used = 0
    end

    def withdraw(amount)
      time_passes
      @balance -= (amount + 1)
      if @balance < 0
        puts "Insufficient Funds. Total in checking account: "
        return @balance += (amount + 1)
      else
        return @balance
      end
    end

    def withdraw_using_check(amount)
      time_passes
      @balance -= amount
      if @balance <= -10
        puts "Insufficient Funds. Total in checking account: "
        return @balance += amount
      else
        @checks_used += 1
        if @checks_used <= 3
          return @balance
        else
          return @balance -= 2
        end
      end
    end

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
