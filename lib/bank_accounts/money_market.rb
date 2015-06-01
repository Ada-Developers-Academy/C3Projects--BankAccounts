module BankAccounts
  class MoneyMarketAccount < Account
    attr_accessor :transactions_count
    def initialize(id, initial_balance)
      super

      @transactions_count = 0
      @can_make_transaction = true

      # if balance is not greater than or equal to 10000, raise an error
      raise ArgumentError.new("Must have minimum balance of $10000") unless initial_balance >= 10000
    end

    def can_make_transaction?
      if (@balance >= 10000) || (@transactions_count <= 6)
        return true
      elsif (@balance > 10000) || (@transactions_count > 6)
        puts "You have exceeded your maximum amount of transactions for this month."
        return @balance
      end


    end

    # DIDN'T HAVE CHANCE TO GET CODE BELOW TO WORK CORRECTLY
    # :(

    # def withdraw(amount)
    #   # if given amount is not a number or less than zero, then raise an error
    #   not_num_error unless amount.is_a? Numeric
    #   negative_num_error unless amount > 0
    #
    #   if @balance < amount
    #     puts ("Insufficient funds. Please withdraw an amount less than or equal to #{@balance}")
    #     return @balance
    #   end
    #
    #   if can_make_transaction?
    #     if (@balance - amount) < 10000
    #       @balance -= (amount + 100)
    #     elsif (@balance - amount) >= 10000
    #       @balance -= amount
    #     end
    #
    #     @transactions_count += 1
    #     return @balance
    #
    #   else
    #     return @balance
    #   end
    #
    # end
    #
    #
    # def deposit(amount)
    #
    # end

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

    def reset_transactions
      @transactions_count = 0
    end

  end
end
