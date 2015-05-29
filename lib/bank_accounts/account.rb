require 'pry'

module BankAccounts
  class Account
    attr_accessor :id, :balance


    def initialize(id, initial_balance)
      raise ArgumentError.new("Cannot have negative number for initial balance") if initial_balance < 0

      @id = id
      @balance = initial_balance
    end


    def withdrawl(amount)
      if amount > @balance
        puts ("Insufficient funds. Please withdrawl an amount less than or equal to #{@balance}")
      else
        @balance -= amount
      end

      return @balance
    end

    def deposit(amount)
      raise ArgumentError.new("Cannot have negative number for initial balance") if amount < 0

      @balance += amount
    end

  end

end
    # binding.pry
