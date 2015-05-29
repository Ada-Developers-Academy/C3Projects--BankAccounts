module BankAccounts
  require "pry"

  class Account
    attr_reader :id, :balance

    def initialize(id, initial_balance)
      @id = id

      # raises error if initial_balance amount is negative
      # sets initial_balance to balance
      if initial_balance < 0
        raise ArgumentError.new("You need money to open this account. Please try again")
      else
        @balance = initial_balance
      end
    end

    def withdraw(amount)
      # returns error message if withdrawal amount is greater than balance
      # removes input amount from balance
      if amount > @balance
        return "Insufficient funds to remove this amount. Please try a smaller amount."
      else
        @balance -= amount
      end
    end

    def deposit(amount)
      # adds input amount to balance
      @balance += amount
    end

  end #class
end # module
