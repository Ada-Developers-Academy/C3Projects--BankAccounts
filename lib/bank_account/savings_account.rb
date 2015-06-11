module BankAccount

  class SavingsAccount < Account
    attr_reader :id, :balance

    def initialize(id, initial_balance)
      @id = id
      @balance = initial_balance
      # again, made initial balance equal to instance variable balance, which actually turns out to be the current balance

      #this raises an ArgumentError to make sure that the initial balance can't be lower than 10
      unless @balance >= 10
        raise ArgumentError.new("You can't start out with a balance below $10. Add moar monies.")
      end

    end

    def withdraw(amount)

      # I made a new variable to represent the transaction fee added to the amount of withdrawal
      amount_with_fee = amount + 2

      # if the withdrawal amount is 0 AND the current balance is greater than 10, it will still charge a transaction fee.
      if amount == 0 && @balance > 10
        puts "You actually didn't withdraw any money. Still chargin ya $2. Sorrynotsorry."
        @balance -= amount_with_fee

      # otherwise for any other withdrawal amount, do a valid withdrawal if the current balance is more than $10
      # AND if said withdrawal wont make the account go under $10
      elsif @balance > 10 && ((@balance - amount_with_fee) >= 10)
        @balance -= amount_with_fee

      # this means that you tried to withdraw an amount that will make savings be less than $10
      # and so it will just return an error and the unmodified balance
      else
        puts "You can't go under $10. Your balance is staying at $#{@balance}."
      end
      return @balance
    end

    # inherited the deposit behavior from the parent class, BankAccount::Account
    def deposit(amount)
      super
    end

    def add_interest(rate)
      #stores the balance's interest in a variable
      interest = @balance * rate/100

      #stores the new updated balance from the current balance plus the interest
      #which will make the current balance reflect that when calling balance on Savings Account
      @balance += interest
      puts "Your interest rate to be added is $#{interest}. Call balance to see updated amount."
      return interest
    end
  end
end
