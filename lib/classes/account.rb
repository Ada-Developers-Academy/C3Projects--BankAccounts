module BankAccount
  class Account
    attr_accessor :id, :initial_balance

    def self.new(id, initial_balance)
      @id              = id
      @initial_balance = initial_balance
      if initial_balance < 0
        raise ArgumentError.new, "Cannot have a negative initial account balance"
      end
    end

  end
end
