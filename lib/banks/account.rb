module BankAccount
  class Account

    def initialize(id, initial_balance)
      @id = id
      @current_balance = initial_balance

      if initial_balance <  0
        # accounts cannot be created with a negative balance
        raise ArgumentError.new("Bank accounts cannot be opened with a negative balance.")
      end
    end

    def balance
      return @current_balance
    end

    def withdraw(amount)
      if amount > @current_balance
        # accounts are not allowed to go below 0
        # #withdraw will return the previous balance
        puts "WARNING: You cannot remove that much money from your account."
        return @current_balance
      else
        return @current_balance -= amount
      end
    end

    def deposit(amount)
      return @current_balance += amount
    end
  end # class
end # module
