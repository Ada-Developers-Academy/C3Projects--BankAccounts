module BankAccount
  class Account
  attr_accessor :id, :initial_balance

    def initialize(id, initial_balance)
      if initial_balance < 0
        raise ArgumentError.new("You cannot open an account with a negative balance.")
      else
      @id = id.round(2)
      @initial_balance = initial_balance.round(2)
      @balance = initial_balance.round(2)
      end
    end

    def rounded(number)
      number.round(2)
    end

    def get_balance
      return @balance
    end

    def withdraw(amount)
      amount = amount.rounded
      if amount > @balance
        puts "Nonsufficient funds."
        get_balance
      else
        @balance -= amount
        get_balance
      end
    end

    def deposit(amount)
      amount = amount.rounded
      if amount > 2_000_000
        puts "We are unable to handle deposits of that size. May we suggest opening an account with our Swiss sister bank 'En Huffe Güld'. For information call 1-800-123-4567"
        present_balance
      else
        @balance += amount
        get_balance
      end
    end

  end # class end
end # module end
