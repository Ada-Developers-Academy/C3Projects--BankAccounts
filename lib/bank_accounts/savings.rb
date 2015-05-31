require 'pry'

module BankAccounts
  class SavingsAccount < Account

    def round_to_hundredths(n)
      n = (((n * 100).floor) / 100.0)
      return n
    end

    def initialize(id, initial_balance)
      # Require at least $10 to start savings account
      if round_to_hundredths(initial_balance) < 10
        raise ArgumentError.new "MINIMUM BALANCE $10 REQUIRED"
      end

      # inherit from Account parent class
      super
    end

    def withdraw(amount)

      # fee of $2 for every withdrawal transaction
      amount += 2

      # savings accounts have $10 minimum
      # error raised if withdrawal causes balance to dip below $10
      if (@balance - amount) < 10
        raise ArgumentError.new "WARNING - You must have at least $10 in your savings account.\nYour current balance is $#{round_to_hundredths(@balance)}."
        return round_to_hundredths(@balance)
      else
        super
        return round_to_hundredths(@balance)
      end
    end

    def interest(rate)
      # calculate the interest rate and add it to the balance
      interest = @balance * (rate / 100)
      @balance += interest

      # return interest amount
      return round_to_hundredths(interest)
    end

  end # class
end # module
