require 'pry'

module BankAccounts
  class CheckingAccount < Account

    attr_reader :checks_used

    def initialize(id, initial_balance)
      # inherit from Account class
      super

      @checks_used = 0
    end

    def withdraw(amount)
      #incur a fee of $1 with each withdrawal
      amount += 1
      super
      return @balance
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