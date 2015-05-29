require 'spec_helper'
require 'bank_accounts'

describe BankAccounts::SavingsAccount do
  
  it "inherits from class Account" do
    expect(BankAccounts::SavingsAccount.superclass).to eq(BankAccounts::Account)
  end

end # describe

# Requirements for class SavingsAccount --------------------------------->

# Create a `SavingsAccount` class with a minimum of 6 specs. The class should inherit behavior from the `Account` class. It should include updated logic within the following methods:
# - `self.new(id, initial_balance)`: creates a new instance with the instance variable `id` and 'initial_balance' assigned
#   - The initial balance cannot be less than $10. If it is, this will `raise` an `ArgumentError`
# - `#withdraw(amount)`: The input amount gets taken out of the account as result of an ATM transaction. Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance.
#   - Does not allow the account to go below the $10 minimum balance - Will output a warning message and return the original un-modified balance
