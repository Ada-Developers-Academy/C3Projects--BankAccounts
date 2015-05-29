module BankAccount
  class SavingsAccount < Account

    def initialize(id, initial_balance) # [breakfast]
      # the initial balance cannot be less than $10. If it is, this will raise an ArgumentError [breakfast]
      raise ArgumentError, "insufficient balance" unless initial_balance >= 10
      super
    end

    def withdraw(amount) # [breakfast]
      # each withdrawal incurs a #2 fee (taken out of balance) [breakfast]
      super(amount, 2, 10) # (amount, transaction_fee, min_balance)
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
