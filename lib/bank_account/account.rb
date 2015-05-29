module BankAccount

  class Account
    attr_reader :id, :initial_balance

    def initialize(id, initial_balance)
      @id = id
      @initial_balance = initial_balance

      unless @initial_balance >= 0
        raise ArgumentError.new("Balance can't be below 0")
      end

    end



    def withdraw(amount)

    end

    def deposit(amount)
    end

    def balance
    end

  end

end
