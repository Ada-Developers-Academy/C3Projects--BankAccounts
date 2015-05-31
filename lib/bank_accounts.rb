# Module

require "awesome_print"

require_relative("bank_accounts/account.rb")
require_relative("bank_accounts/savings_account.rb")

#__________________________________________________________________________
# testing suit for Account class

# ap account = BankAccount::Account.new(30, 3000)
# puts "Initial balance: $#{account.balance}"
#
# withdraw = account.withdraw(1000)
# puts "Withdraw amount: $1000"
#
# balance = account.balance
# puts "Current balance: $#{balance}"
#
# deposit = account.deposit(2500)
# puts "Deposit amount: $2500"
#
# balance = account.balance
# puts "Current balance: $#{balance}"
#

#________________________________________________________________________
# testing suit for SavingsAccount class

# ap saving_account = BankAccount::SavingsAccount.new(3, 10000)
# puts "Initial balance: #{saving_account.balance}"
#
# withdraw = saving_account.withdraw(98)
# puts "Withdraw amount: $98, transaction fee: $2"
#
# balance = saving_account.balance
# puts "Current balance: #{balance}"
#
#
# withdraw = saving_account.withdraw(10)
# puts "Withdraw amount: $10, transation fee: $2"
#
# balance = saving_account.balance
# puts "Current balance: #{balance}"
#
#
# interest = saving_account.add_interest(0.25)
# puts "Interest rate: 0.25%, Interest: $#{interest}"
#
# balance = saving_account.balance
# puts "Current balance: #{balance}"
