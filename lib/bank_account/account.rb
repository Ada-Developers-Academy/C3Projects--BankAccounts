module BankAccount
  class Account
    attr_reader :balance
    def initialize(id, initial_balance)

      raise ArgumentError, "Invalid amount." if initial_balance < 0

      @balance = initial_balance
      @account_id = id

    end

    def withdraw(amount)

      if amount > @balance
        puts "invalid withdrawal amount"
        return @balance
      else
        new_balance = @balance - amount
        @balance = new_balance
        puts "You balance is: $#{@balance}."
        return @balance
      end
    end # withdraw

    def deposit(amount)
      new_balance = @balance + amount
       return @balance = new_balance
    end

  end # class


end # module
