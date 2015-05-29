# THINGS TO RESEARCH FOR LATER
# * raise
# * ArgumentError
# * rspec method raise_exception

module BankAccounts
  class Account
    attr_reader :id, :balance

    def initialize(id, initial_balance)
      @id = id
      @balance = initial_balance
    end

    def deposit(amount)
      @balance += amount
    end

    def withdraw(amount)
      @balance -= amount
    end

  end # class Account
end # module BankAccounts
