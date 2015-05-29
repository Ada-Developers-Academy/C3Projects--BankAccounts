module BankAccount

  class Account
    attr_reader :id, :balance # attributes default instance method

    def initialize(id, initial_balance)
      @id = id
      @balance = initial_balance #local variable when comes in and create it

      unless @balance >= 0
        raise ArgumentError.new("You can't start out with a negative balance. Add some monies")
      end
      #need to return balance

    end

    def withdraw(amount)
      unless @balance >= amount
        @balance = 0
        return "You can't overdraw. Your balance is #{@balance}."
      else
        @balance -= amount
      end
    end

    def deposit(amount)
      @balance += amount
      return @balance
    end

  end

end



#new_account = Account.new(10, 50)

# 1) new_account.withdraw(10) => initial_balance - 10 = balance (40)
# 2) new_account.deposit(40) => balance + 40 = (current)balance (40)
#inject!!!!??? or += or >> with each

# [10, 40, 20].inject(0) { |result, element| result + element }
# [w/d, w/d, w/d].inject(initial_balance) { |balance, withdraw/deposit| balance -/+ w/d }
# 0 + 10 = 10 => 10 + 40 = 50 => 50 + 20 = 70 == balance (deposit)
# how to combine with withdraw (in order) but cant go below 0

# def transaction
#call withdraw || deposit
#if transaction = withdraw
#if transaction = deposit
# end.. actual input order?

## if use map/each, what are the elements of the collection?
