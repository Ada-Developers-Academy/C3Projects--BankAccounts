module Bank
  class CheckingAccount < Account
    attr_accessor :checks, :balance

    def reset_checks
      @checks = 3
    end

    def withdraw(amount)
      @balance -= (amount + 1)
      if @balance < 0
        puts "Insufficient Funds. Total in checking account: "
        return @balance += (amount + 1)
      else
        return @balance
      end
    end

    def withdraw_using_check(amount)
      @balance -= amount
      if @balance <= -10
        puts "Insufficient Funds. Total in checking account: "
        return @balance += amount
      else
        @checks -= 1
        return @balance
      end
    end

  end
end
