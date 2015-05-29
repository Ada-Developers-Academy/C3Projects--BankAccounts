module BankAccount
  class Account
    attr_accessor :id, :initial_balance

    def initialize(id, initial_balance)
      @id              = id
      @initial_balance = initial_balance
      if initial_balance < 0
        raise ArgumentError.new, "Cannot have a negative account balance"
      end
    end

    def withdraw(amount)
      @initial_balance -= amount
      if amount > @initial_balance
        raise ArgumentError.new, "Cannot withdraw more money than available in your account."
      end
      return @initial_balance
    end

    def deposit(amount)
      @initial_balance += amount
    end

    def balance
      @initial_balance
    end

  end
end
