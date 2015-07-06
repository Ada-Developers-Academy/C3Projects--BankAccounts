module Bank
  class SavingsAccount < Account

    def initialize(id, initial_balance)
      super
      raise ArgumentError.new "Insufficient Funds" unless initial_balance >= 10
    end

    # charges $2 for every withdrawal
    def withdraw(amount)
      @balance -= (amount + 2)
      if @balance < 10
        puts "Savings can not fall below $10.Your remaining savings amount is: "
        return @balance += (amount + 2)
      else
        return @balance
      end
    end

    # calculates interest on balance where rate is in %
    def add_interest(rate)
      accrued_interest = @balance * (rate/100.to_f)
      @balance += accrued_interest
      return accrued_interest
    end

  end
end
