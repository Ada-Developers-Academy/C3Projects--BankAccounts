module BankAccount

  class SavingsAccount < Account
    attr_reader :id, :balance

    def initialize(id, initial_balance)
      @id = id
      @balance = initial_balance

      unless @balance >= 10
        raise ArgumentError.new("You can't start out with a balance below $10. Add moar monies.")
      end

    end

    def withdraw(amount)
      amount_with_fee = amount + 2

      if amount == 0 && @balance > 10
        puts "You actually didn't withdraw any money. Still chargin ya $2. Sorrynotsorry."
        @balance -= amount_with_fee
      elsif @balance > 10 && ((@balance - amount_with_fee) >= 10)
        @balance -= amount_with_fee
      else
        puts "You can't go under $10. Your balance is staying at $#{@balance}."
        return @balance
      end
    end

    def deposit(amount)
      super
    end

    def add_interest(rate)
      @balance += @balance * rate/100
      puts "Your interest rate to be added is $#{@balance * rate/100}. Call balance to see updated balance."
      return @balance * rate/100
    end



    # def add_interest(rate)
    #   @balance += @balance * rate/100
    #   return @balance * rate/100
    # end


  end
end
