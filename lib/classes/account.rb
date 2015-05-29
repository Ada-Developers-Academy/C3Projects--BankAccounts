module BankAccount
  class Account
    attr_accessor :id, :current_balance

    def initialize(id, initial_balance)
      if initial_balance < 0
        raise ArgumentError.new, "Cannot have a negative account balance"
      end
      @id              = id
      @current_balance = initial_balance
    end

    def withdraw(amount)
      @current_balance -= amount
      if amount > @current_balance
        raise ArgumentError.new, "Cannot withdraw more money than available in your account."
      end
      return @current_balance
    end

    def deposit(amount)
      @current_balance += amount
    end

    def balance
      @current_balance
    end

  end
end
