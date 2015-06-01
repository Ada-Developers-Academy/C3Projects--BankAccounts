module BankAccounts

  class Account

    attr_accessor :balance
    attr_reader :id

    def initialize(id, initial_balance)
      bank_info   # see private methods
      min_num_guard(initial_balance)

      @id = id
      @balance = initial_balance
    end

    # SUBTRACT AMOUNT + FEE FROM BALANCE & RETURN BALANCE
    def withdraw(amount)
      neg_num_guard(amount)

      amount += @atm_withdraw_fee   # useful in children classes

      if (@balance - amount) < @min_balance
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

    private

    # CHECKS TO MAKE SURE NUMBER ISN'T NEGATIVE (OR ZERO); THROWS ERROR IF SO
    def neg_num_guard(num)
      raise ArgumentError, "negative numbers & zero are not valid" if num <= 0
    end

    # CHECKS TO MAKE SURE AMOUNT IS ABOVE ALLOWED MINIMUM WHEN INITIALIZING
    def min_num_guard(num)
      raise ArgumentError, "below allowed minimum" if num < @min_balance
    end

    # VARIABLES CREATING DURING INITIALIZATION
    # SEPERATED FROM INITIALIZE SO CAN CHANGE WHEN INHERITED
    def bank_info
      @min_balance = 0
      @atm_withdraw_fee = 0
    end

  end

end
