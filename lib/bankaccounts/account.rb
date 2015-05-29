module BankAccounts

  class Account
    attr_accessor :id, :initial_balance

    def initialize(id, initial_balance)
      # raises an error if initial_balance is negative
      if initial_balance < 0
        raise ArgumentError.new("Only positive balances allowed")
      end
      @id = id
      @initial_balance = initial_balance
    end

    def withdraw(amount)
      # the input amount gets taken out of the account as result of an ATM transaction 
      # return value should be the updated account balance
    end


  end # class
end # module
