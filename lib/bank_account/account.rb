module BankAccount
  class Account
    attr_reader :balance

    def initialize(id, initial_balance)
      # cannot start a bank account with a negative balance
      raise ArgumentError, "Invalid amount." if initial_balance < 0
      @balance = initial_balance
      @account_id = id
    end

    def withdraw(amount)
      # checking to see if account would go negative if withdrawed the amount
      if amount > @balance
        puts "invalid withdrawal amount"
        return @balance
      else
        @balance -= amount
        puts "You balance is: $#{@balance}."
        return @balance
      end
    end # withdraw

    def deposit(amount)
       return @balance += amount
    end

  end # class
end # module
