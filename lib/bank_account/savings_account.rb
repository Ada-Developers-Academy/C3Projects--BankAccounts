module BankAccount
  class SavingsAccount < Account

    attr_accessor :id, :balance

    def initialize (id, initial_balance)
      if initial_balance < 10
        raise ArgumentError, 'You cannot open a Savings Account with less than $10'
      end
      @id = id
      @balance = initial_balance
    end

    def withdraw(amount)
      if @balance - amount < 12
        print "This transaction cannot be completed because you don\'t have enough money to maintain your minimum balance."
        return @balance
      end
      @balance = @balance - amount - 2
      return @balance
    end

    def add_interest(rate)
      interest = @balance * rate/100
      @balance = @balance + interest
      return interest
    end

  end
end
