# module BankAccount
#   attr_reader :initial_balance
#   # create a SavingsAccount class with a minimum of 6 specs [breakfast]
#   # the class should inherit behavior from the Account class [breakfast]
#   class SavingsAccount < Account

#     # self.new(id, initial_balance): creates a new instance with the instance variable id and 'initial_balance' assigned [breakfast]
#       # the initial balance cannot be less than $10. If it is, this will raise an ArgumentError [breakfast]
#     def initialize(id, initial_balance)
#       super
#       raise ArgumentError, "insufficient balance" unless initial_balance >= 10
#       @initial_balance = initial_balance
#     end


#     # #withdraw(amount): The input amount gets taken out of the account as result of an ATM transaction. Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance [breakfast]
#       # Does not allow the account to go below the $10 minimum balance - Will output a warning message and return the original un-modified balance [breakfast]
#     def withdraw(amount)
#     end

#     # #add_interest(rate): Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance) [breakfast]
#       # Input rate is assumed to be a percentage (i.e. 0.25) [breakfast]
#       # The formula for calculating interest is balance * rate/100
#       # Example: If the interest rate is 0.25% and the balance is $10,000, then the interest is $25 and the new balance becomes $10,025 [breakfast]
#     def add_interest(rate)
#     end

#   end # class
# end # module
