module BankAccount
  class SavingAccount < Account

    def initialize(id, initial_balance)
      super
    end

    def withdraw(amount)
      super
      # not working
     binding.pry

      @balance= @balance - 2
      # return @balance
    end

    def add_interest(rate)
      interest = @balance * rate/100
      return interest
    end


  end # class


end # module
