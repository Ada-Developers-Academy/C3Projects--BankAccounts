module BankAccount
  class SavingsAccount < Account
    attr_reader :initial_balance

    def initialize(id, initial_balance) # [breakfast]
      # the initial balance cannot be less than $10. If it is, this will raise an ArgumentError [breakfast]
      raise ArgumentError, "insufficient balance" unless initial_balance >= 10
      super
      @initial_balance = initial_balance
    end

    def withdraw(amount) # [breakfast]
      # each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance [breakfast]
      amount += 2
      if amount <= @balance - 10
        @balance -= amount
      else
        # $10 minimum balance; output a warning and return un-modified balance [breakfast]
        puts "Insufficient funds! You have #{@balance} in your account."
        @balance
      end
    end

    # #add_interest(rate) [breakfast]
    def add_interest(rate) # input rate is assumed to be a percentage (i.e. 0.25 == 0.25%) [breakfast]
      interest_earned = ( (rate/100) * @balance ).round(2)
      @balance += interest_earned

      # return the interest that was calculated and added to the balance (not the updated balance) [breakfast]
      interest_earned
    end

  end # class
end # module
