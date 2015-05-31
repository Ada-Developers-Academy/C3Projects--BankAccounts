require 'pry'

module BankAccounts
  class CheckingAccount < Account

    def initialize(id, initial_balance)
      super
    end

    def withdraw(amount)
      #incur a fee of $1 with each withdrawal
      amount += 1
      super
    end

    def withdraw_using_check(amount)
      # checks_used = 1
      # while checks_used < 3
      # LOOP
      # Raises warning message if overdraft goes lower than -$10
      if (@balance - amount) < -10
        raise ArgumentError.new "OVERDRAFT WARNING - only $10 overdraft allowed. Your current balance is #{@balance}."
        return @balance
        
      # Return the updated balance after check withdrawal
      else
        @balance -= amount
        return @balance
      end
    end
binding.pry
  end # class
end # module