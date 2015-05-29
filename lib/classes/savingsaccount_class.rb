module BankAccount

  class SavingsAccount < Account

    def initialize(id, initial_balance)
      raise ArgumentError.new ("You cannot create an account with a negative balance") unless initial_balance >= 10
      super(id, initial_balance)
    end

  end
end
