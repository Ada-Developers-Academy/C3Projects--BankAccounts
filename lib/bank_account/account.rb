module BankAccount

  class Account
    attr_reader :id, :balance # attributes' default instance method

    #class method
    def initialize(id, initial_balance)
      @id = id
      @balance = initial_balance #local variable
      # made initial balance equal to instance variable balance, which actually turns out to be the current balance

      #this raises an error to prevent the initial balance from being lower than 0
      unless @balance >= 0
        raise ArgumentError.new("You can't start out with a negative balance. Add some monies")
      end
    end

    def withdraw(amount)

  # If the amount to withdraw is greater than the current balance, it throws and error and returns the original balance
      unless @balance >= amount
        puts "You can't overdraw. Your balance is still $#{@balance}."
        return @balance

  # Otherwise, just subtract from the current balance and increment it so balance will always stay current
      else
        @balance -= amount
      end
    end

# adds an amount to the current balance and increments it so the balance will always stay current
    def deposit(amount)
      @balance += amount
      return @balance
    end
  end
end
