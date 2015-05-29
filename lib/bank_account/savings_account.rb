module BankAccount
  class SavingsAccount < Account
    def initialize(id, initial_balance)
      if initial_balance < 10
        raise ArgumentError.new("Minimum ammount of $10 required to open savings account.")
      else
        super
      end
    end

    def withdraw (amount)
      if (@balance - amount - 2) < 10
        puts "Nonsufficient funds; your savings account has a $10 minimum balance."
        balance
      else
        @balance -= (amount + 2)
        balance
      end
    end

    def add_interest(rate)
      interest = (rate/100)*@balance
      return interest
    end
  end # class end
end # module end
