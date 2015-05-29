module BankAccount
  class CheckingAccount < Account

    attr_accessor :id, :balance

    def initialize (id, initial_balance)
      @id = id
      @balance = initial_balance
    end

    def withdraw(amount)
      @balance = @balance - amount - 1
      return @balance
    end

    def withdraw_using_check(amount)
      @balance = @balance - amount
      return @balance
    end

  end
end
