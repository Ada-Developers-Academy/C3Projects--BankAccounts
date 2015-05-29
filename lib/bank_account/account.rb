module BankAccount
  class Account

    attr_accessor :id, :balance

    def initialize (id, initial_balance)
      if initial_balance < 0
        raise ArgumentError, 'You cannot use a negative number for your initial balance'
      end
      @id = id
      @balance = initial_balance
    end

    def withdraw(amount)
      if @balance - amount < 0
        print "This transaction cannot be completed because you don\'t have enough money."
        return @balance
      end
      @balance = @balance - amount
      return @balance
    end

    def deposit (amount)
      if amount < 0
        print "This transaction cannot be completed because you have input a negative number. Please execute a withdraw instead."
        return @balance
      end
      @balance = @balance + amount
      return @balance
    end

    def balance
      return @balance
    end

  end
end
