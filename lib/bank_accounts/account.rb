module BankAccounts
  class Account
    attr_accessor :id, :balance

    # error message for negative number inputs
    def negative_num_error
      raise ArgumentError.new("Cannot pass in negative argument")
    end

    # error message for non-number inputs
    def not_num_error
      raise ArgumentError.new("Parameter must be a number")
    end


    # create new instance of Account class
    def initialize(id, initial_balance)
      # if id or initial balance are not numbers, then raise an error
      not_num_error unless (id.is_a? Numeric) && (initial_balance.is_a? Numeric)

      # if initial_balance is less than zero, then raise an error
      raise ArgumentError.new("Balance needs to be greater than $0") unless initial_balance > 0

      @id = id
      @balance = initial_balance
    end

    # method that subtracts given amount from balance
    def withdraw(amount)
      # if given amount is not a number or less than zero, then raise an error
      not_num_error unless amount.is_a? Numeric
      negative_num_error unless amount > 0

      # if the given amount exceeds the balance, then puts an error message and return original balance
      if amount > @balance
        puts ("Insufficient funds. Please withdraw an amount less than or equal to #{@balance}")
        return @balance
      # otherwise, subtract given amount from balance
      else
        @balance -= amount
      end

    end

    # method that adds given amount to balance
    def deposit(amount)
      # if given amount is less than zero, then raise an error
      negative_num_error if amount < 0

      @balance += amount
    end
  end
end
