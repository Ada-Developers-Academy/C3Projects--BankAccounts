require 'pry'

module BankAccounts
  class Account
    attr_accessor :id, :balance

    def negative_num_error
      raise ArgumentError.new("Cannot pass in negative argument")
    end

    def not_num_error
      raise ArgumentError.new("Parameter must be a number")
    end

    def balance_error
      raise ArgumentError.new("Balance needs to be greater than $0")
    end


    def initialize(id, initial_balance)
      not_num_error unless id.class == Fixnum && initial_balance.class == Fixnum

      balance_error unless initial_balance > 0

      @id = id
      @balance = initial_balance
    end


    def withdraw(amount)
      if amount > @balance
        puts ("Insufficient funds. Please withdraw an amount less than or equal to #{@balance}")
        return @balance
      else
        @balance -= amount
      end

    end

    def deposit(amount)
      negative_num_error if amount < 0

      @balance += amount
    end

  end

end
    # binding.pry
