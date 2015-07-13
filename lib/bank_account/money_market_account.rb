module BankAccount
  class MoneyMarketAccount < Account
    attr_accessor :id, :initial_balance, :transaction_count

    def initialize(id, initial_balance)
      if initial_balance < 10_000
        raise ArgumentError.new("You are too poor, get out of here peasant!")
      else
        super
        @transaction_count = 6
      end
    end

    def reduce_transaction
      @transaction_count -= 1
    end

    def withdraw(amount)
      amount = amount.rounded
      if @transaction_count < 1
        puts "you have reached your transaction limit for the month"
        get_balance

      elsif (@balance - amount) < 0
        puts "Nonsufficient funds"
        get_balance

      elsif (@balance - amount) < 10_000
        if (@balance - (amount + 100)) < 0
          puts "Nonsufficient funds"
          return @balance
        else
          @balance -= (amount + 100)
          reduce_transaction
          get_balance
        end
      else
        super
        reduce_transaction
        get_balance
      end
    end

    def deposit(amount)
      amount = amount.rounded
      if @balance < 10_000 && transaction_count < 1 && (@balance + amount) >= 10_000
        @balance += amount
        return @balance
      else
        super
        reduce_transaction
        get_balance
      end
    end

    def reset_transactions
      @transaction_count = 6
    end

    def add_interest(rate)
      interest = (rate/100)*@balance
      interest = interest.rounded
      return interest
    end
  end # class end
end # module end
