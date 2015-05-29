module BankAccount
  class CheckingAccount < Account
    def initialize(id, initial_balance)
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
      # binding.pry
      if (@balance - amount) < -10
        puts "Invalid check amount, #{amount} is beyond your $10 overdraft protection."
        return @balance
      else
        if @check_counter > 3
          # @balance = @balance - 2
        end

        @check_counter += 1
        @balance = @balance - amount
        return @balance
    end
    end

  end # class

end # module
