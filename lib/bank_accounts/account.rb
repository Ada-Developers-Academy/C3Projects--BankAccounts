module BankAccount

  class Account
    attr_accessor :id, :balance
#_________________________________________________________________________________________________
# initialization

    def initialize(id, initial_balance)
      # # Checking if id is a number
      # # if it's not then it raises ArgumentError
      if id.class != Fixnum
        raise ArgumentError
      end

      @id = id

      # Checking if initial_balance is a positive number
      # if it's not then it raises ArgumentError
      if (initial_balance.class != Fixnum && initial_balance.class != Float) || initial_balance < 0
        raise ArgumentError
      end

      @balance = initial_balance
    end
#________________________________________________________________________________________________
# Withdraw method

    def withdraw(amount)

      if amount <= @balance
         @balance -= amount
      else
        # if withdraw amount is bigger then current balance=> warning message
         puts "Insufficient funds!"
      end
      return @balance
    end
#_____________________________________________________________________________________________
# Deposit method

    def deposit(amount)

      @balance += amount
      return @balance
    end

    def balance
      return @balance
    end
  end
end
