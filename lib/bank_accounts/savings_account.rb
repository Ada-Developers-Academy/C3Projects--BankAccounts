module BankAccounts
  # SavingsAccount inherits from Account
  class SavingsAccount < Account

    def initialize(id, initial_balance)
      super
      # if balance is not greater than or equal to 10, raise an error
      raise ArgumentError.new("Must have minimum balance of $10") unless initial_balance >= 10
    end

    # method to withdraw given amount from balance
    def withdraw(amount)
      # if given amount is not a number or greater than 0, raise an error
      not_num_error unless amount.is_a? Numeric
      negative_num_error unless amount > 0

      # there is a $2 transaction fee for each withdrawal
      # if the given amount + transaction fee will bring the balance below 10,
      # raise an error and return current balance
      if (@balance - amount - 2) < 10
        puts "Insufficient funds. Balance cannot be below $10."
        return @balance
      # otherwise, subtract the given amount and the $2 fee from balance
      else
        @balance -= (amount + 2)
      end
    end

    # method to add interest to balance
    def add_interest(rate)
      # if given amount is not a number or greater than 0, raise an error
      not_num_error unless rate.is_a? Numeric
      negative_num_error unless rate > 0

      # calculates interest baed on given rate
      interest_on_balance = @balance * rate/100
      # add calculated interest to balance
      @balance += interest_on_balance

      # return the calculated interest
      return interest_on_balance
    end
  end
end
