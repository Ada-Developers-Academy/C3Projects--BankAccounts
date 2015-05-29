module BankAccount

  # require class files
  require_relative('./classes/account_class')
  require_relative('./classes/savingsaccount_class')
  require_relative('./classes/checkingaccount_class')
end

# x = BankAccount::SavingsAccount.new(3,500)
# puts x.add_interest(0.50)
# puts x.current_balance
