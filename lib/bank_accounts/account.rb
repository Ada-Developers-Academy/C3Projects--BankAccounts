module BankAccounts

  class Account

    attr_accessor :id, :balance

    def initialize(id, initial_balance)
      neg_num_guard(initial_balance)

      @id = id
      @balance = initial_balance
    end

    # SUBTRACT AMOUNT FROM BALANCE & RETURN BALANCE
    def withdraw(amount)
      neg_num_guard(amount)

      if @balance < amount
        puts "Cannot withdraw amount; not enough money in account."
        return @balance
      end

      @balance -= amount
    end

    # ADD AMOUNT TO BALANCE & RETURN BALANCE
    def deposit(amount)
      neg_num_guard(amount)

      @balance += amount
    end

    # CHECKS TO MAKE SURE NUMBER ISN'T NEGATIVE; THROWS ERROR IF SO
    def neg_num_guard(num)
      raise ArgumentError, "negative number" if num < 0
    end

  end

end
