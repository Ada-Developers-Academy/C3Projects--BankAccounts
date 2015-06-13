require 'pry'

module BankAccounts
  class CheckingAccount < Account

    attr_reader :balance, :checks_used

    def initialize(id, initial_balance)
      # inherit from Account class
      super

      # start with 0 checks used
      @checks_used = 0
    end

    def withdraw(amount)
      #incur a fee of $1 with each withdrawal
      amount += 1
      super
      return round_to_hundredths(@balance)
    end

    def withdraw_using_check(amount)
      @checks_used += 1 # increase checks used with each method call

      if @checks_used > 3
        # $2 fee for greater than 3 checks
        amount += 2

        # Raises warning message if overdraft goes lower than -$10
        if (@balance - amount) < -10
          raise ArgumentError.new "OVERDRAFT WARNING - only $10 overdraft allowed. Your current balance is #{round_to_hundredths(@balance)}."
        else
          @balance -= amount
        end
        return @balance = round_to_hundredths(@balance)

      # no transaction fee for 3 or fewer checks
      else
        if (@balance - amount) < -10
          raise ArgumentError.new "OVERDRAFT WARNING - only $10 overdraft allowed. Your current balance is #{round_to_hundredths(@balance)}."
        else
          @balance -= amount
        end
        return @balance = round_to_hundredths(@balance)
      end
    end

    def reset_checks
      @checks_used = 0
      return @checks_used
    end

  end # class
end # module
