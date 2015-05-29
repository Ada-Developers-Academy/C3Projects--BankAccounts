module BankAccounts

  class SavingsAccount < Account
    attr_accessor :id, :balance

    def initialize(id, initial_balance)
      # raises an error if initial_balance is less than 10
      if initial_balance < 10
        raise ArgumentError.new("Initial balances must be at least 10")
      end
      @id = id
      @balance = initial_balance
    end

  end # class
end # module
