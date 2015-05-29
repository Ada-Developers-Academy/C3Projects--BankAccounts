module BankAccount
  class MoneyMarketAccount < Account
    attr_accessor :id, :initial_balance, :transaction_count

    def initialize(id, initial_balance)
      if initial_balance < 10_000
        raise ArgumentError.new("You are too poor, get out of here peasant!")
      else
      @id = id
      @balance = initial_balance
      @transaction_count = 0
      end
    end


  end # class end
end # module end
