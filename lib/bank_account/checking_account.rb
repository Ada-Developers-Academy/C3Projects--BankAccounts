module BankAccount 
  class CheckingAccount < Account
    attr_accessor :checks

    def withdraw(amount)
    amount += 1
    if @balance - amount <= 0
      puts "You cannot withdraw THAT much money."
    else
      @balance -= amount
    end
    return @balance
    end

    def withdraw_using_check(amount)
      @checks += 1
      if @checks > 3 
        amount += 2
      end
      if @balance - amount < -10
        puts "your account is over drawn"
      else
        @balance -= amount
      end
      return @balance
 
    end

    def reset_checks
      puts @checks
      @checks = 0
      return @checks
    end

  end
end