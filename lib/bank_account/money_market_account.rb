module BankAccount
  class MoneyMarketAccount < Account
    attr_accessor :id, :initial_balance, :transaction_count

    def initialize(id, initial_balance)
      if initial_balance < 10_000
        raise ArgumentError.new("You are too poor, get out of here peasant!")
      else
      @id = id
      @balance = initial_balance
      @transaction_count = 6
      end
    end

    def reduce_transaction
      @transaction_count -= 1
    end

    def withdraw(amount)
      if @transaction_count < 1
        puts "you have reached your transaction limit for the month"
        balance

      elsif (@balance - amount) < 0
        puts "Nonsufficient funds"
        balance

      elsif (@balance - amount) < 10_000
        # if (@balance -= amount + 100) < 0
        #   puts "Nonsufficient funds"
        #   balance
        # else
        @balance -= (amount + 100)
        reduce_transaction
        balance
        end

      else
        @balance -= amount
        reduce_transaction
        balance
      end
    end

    ##deposit(amount). Returns the updated account balance.
# Each transaction will be counted against the maximum number of transactions
# Exception to the above: A deposit performed to reach or exceed the minimum balance of $10,000 is not counted as part of the 6 transactions.
  end # class end
end # module end
