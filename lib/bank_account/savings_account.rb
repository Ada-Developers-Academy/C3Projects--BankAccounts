module BankAccount
  class SavingsAccount < Account

    def initialize(id, initial_balance)
      @id = id
      if initial_balance < 10
        raise ArgumentError, "Savings account cannot initialize with only #{initial_balance}."
      else
        @balance = initial_balance
      end
    end

    def withdraw(amount)
      amount += 2
      if @balance - amount < 10
        puts "You cannot withdraw #{amount}. It will make your account go below $10."
      else
        @balance -= amount
      end
      return @balance
    end

    def add_interest(rate)
      interest = 0.0
      interest = @balance * rate/100
      puts interest
      @balance += interest
      puts @balance
      return interest

    end


  end
end