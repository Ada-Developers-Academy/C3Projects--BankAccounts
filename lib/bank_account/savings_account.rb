module BankAccount
  class SavingsAccount < Account

    attr_accessor :id, :balance

    #Savings Accounts need to be opened with a minimum of $10. If an attempt to open
    #an account with less than that occurs, ArgumentError needs to be raised and
    #program should not continue running
    def initialize (id, initial_balance)
      if initial_balance < 10
        raise ArgumentError, 'You cannot open a Savings Account with less than $10'
      end
      @id = id
      @balance = initial_balance
    end

    #A minimum of 10 must be in the account at all times, this would include after
    #the $2 fee has been assessed. So the block should not execute if, after processing
    #the transaction and the fee, this will leave the balance less than 10. And an error
    #message will appear.
    def withdraw(amount)
      if @balance - amount < 12
        print "This transaction cannot be completed because you don't have enough money to maintain your minimum balance."
        return @balance
      end
      @balance = @balance - amount - 2
      return @balance
    end

    #This will calculate the interest on the balance and needs to return the amount
    #of interest and not the new amount with interest. If you call the balance method
    #it should have the new total with the balance as well. interest needs to be entered
    #with a 0.XX format.
    def add_interest(rate)
      interest = @balance * rate/100
      @balance = @balance + interest
      return interest
    end

  end
end
