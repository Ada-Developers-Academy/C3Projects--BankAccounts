module BankAccounts

  class Account

    attr_accessor :id, :balance

    def initialize(id, initial_balance)
      raise ArgumentError, "negative number" if initial_balance < 0

      @id = id
      @balance = initial_balance
    end

    def withdraw

    end

  end

end
