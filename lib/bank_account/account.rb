module BankAccount
  attr_reader :balance, :id
  class Account

    def initialize(id, initial_balance)
      @id = id
      if initial_balance <= 0
        raise ArgumentError, "Account cannot be 0 or less"
      else
        @balance = initial_balance
      end

    end

    def withdraw(amount)
      if @balance - amount <= 0
        puts "There is not enough money to withdraw $#{amount}."
      else
        @balance -= amount
      end
      return @balance
    end

    def deposit(amount)
      @balance += amount
      return @balance
    end

    def balance
      return @balance
    end
     


  end
end

