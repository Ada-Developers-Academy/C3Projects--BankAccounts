module Bank
  class Account
    attr_accessor :id, :balance

    def initialize(id, initial_balance)
      raise ArgumentError.new "Invalid initial balance" unless initial_balance > 0
      @id = id
      @balance = initial_balance
    end

    def withdraw(amount)
      @balance = @balance - amount
      if @balance < 0
        begin
          raise ArgumentError.new "Insufficient funds"
        rescue ArgumentError
          return @balance += amount
        end
      else @balance >= 0
        return @balance
      end
    end

  end
end
