module Bank
  class MoneyMarketAccount < Account
    attr_accessor :num_of_transactions, :balance

    def initialize(id, initial_balance)
      raise ArgumentError, "Account requires minimum balance of $10,000." if initial_balance.to_i < 10_000
      super
      @num_of_transactions = 0
      @balance = initial_balance.to_i
      # @minimum_balance = 10_000
    end

    def is_at_transaction_limit
      if @num_of_transactions >= 6
        # uses abort because I want to end the transaction request
        abort("You've reached your transaction limit for this month.")
      end
    end

    def withdraw(amount)
      is_at_transaction_limit

      if @balance < 10_000
        puts "Cannot withdraw until account balance is $10,000 or more."
        return @balance
      end

      super

      # if the transaction was successful
      if !@is_withdrawal_error
        @num_of_transactions += 1
        @balance -= 100 if @balance < 10_000 # $100 fee
      end

      return @balance
    end

    def deposit(amount)
      is_at_transaction_limit
      balance_before_deposit = @balance
      super

      # if Income(amount) evaluated to 0 there was a problem
      # e.g. amount input was a String
      @is_deposit_error = true if amount == 0

      if !@is_deposit_error && balance_before_deposit > 10_000
        @num_of_transactions += 1
      end

      return @balance
    end
  end
end
