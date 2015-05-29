module BankAccount
  class Account
  attr_accessor :id, :initial_balance

    def initialize(id, initial_balance)
      ## optimize raise_error, initialize
      if initial_balance < 0
        raise ArgumentError.new("You cannot open an account with a negative balance.")
      else
      @id = id
      @initial_balance = Money.new(initial_balance, "usd")
      @balance = initial_balance
      end
    end


    def balance
      return @balance
    end

    def withdraw(amount)
      if amount > @balance
        puts "Nonsufficient funds."
        balance
      else
      @balance -= amount
      balance
      end
    end

    def deposit(amount)
      if amount > 2_000_000
        puts "We are unable to handle deposits of that size. May we suggest opening an account with our Swiss sister bank 'En Huffe Güld'. For information call 1-800-123-4567"
        balance
      else
        @balance += amount
        balance
      end
    end

  end # class end
end # module end
