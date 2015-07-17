module BankAccount
  class CheckingAccount < Account

    def initialize(id, initial_balance)
      # everything but the @check_counter instance variable is inherited from account parent class
      @check_counter = 0
      super
    end

    def withdraw(amount)

      if amount > @balance
        puts "Invalid. That amount is greater than your account balance."
      else
        super
        new_balance = @balance - 1 # $1 transaction fee tacked on
        @balance = new_balance
      end
      return @balance

    end # withdraw

    def withdraw_using_check(amount)
      # cannot go below a -$10 balance on checking account
      if (@balance - amount) < -10
        puts "Invalid check amount, #{amount} is beyond your $10 overdraft protection."
        return @balance
      else
        # determining if person has used over the 3 free checks,
        # will get a #2 fee tacked on if over 3 checks
        if @check_counter >= 3
          amount += 2
        end
        @check_counter += 1
        @balance = @balance - amount
        return @balance
      end
    end

    def reset_checks
      # the bank should reset checks at the end of the month
      @check_counter = 0
    end

  end # class
end # module
