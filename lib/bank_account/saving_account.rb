module BankAccount
  class SavingAccount < Account

    def initialize(id, initial_balance)
      super
    end

    def withdraw(amount)

      # savings account cannot dip below $10
      if @balance - amount < 10
        puts "Your balance cannot be less than $10 in your savings account."
      else
        super
        @balance= @balance - 2 # $2 transaction fee tacked on
      end

      return @balance


    end

    def add_interest(rate)
      interest = @balance * rate/100
      @balance = @balance + interest
      return interest
    end


  end # class


end # module
