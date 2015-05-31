require 'spec_helper'
require 'bank_accounts'

describe BankAccounts::CheckingAccount do

 context "A checking account is a bank account" do
   it "CheckingAccount class inherits from Account class" do
     expect(BankAccounts::CheckingAccount.superclass).to eq(BankAccounts::Account)
   end
 end

 context "When creating a checking account" do
   it "responds to checking account instantiation with 2 arguments" do
     expect(BankAccounts::CheckingAccount).to respond_to(:new).with(2).arguments
   end
 end

 context "When withdrawing from a checking account" do
  let (:checking) { BankAccounts::CheckingAccount.new(0, 80) }

  it "responds to withdraw(amount)" do
    expect(checking).to respond_to(:withdraw)
  end

  it "incurs a fee of $1 for each withdrawal and returns the updated balance" do
    expect(checking.withdraw(14)).to eq(65)
    expect(checking.withdraw(54)).to eq(10)
  end

  it "raises an error when attempting to withdraw more than the current  balance" do
    expect{ checking.withdraw(85) }.to raise_error(ArgumentError, "INSUFFICIENT FUNDS\nYour current balance is $#{checking.balance}.")
  end
 end

end # describe

# Create a `CheckingAccount` class with a minimum of 6 specs. The class should inherit behavior from the `Account` class.

# - `#withdraw(amount)`: The input amount gets taken out of the account as result of an ATM transaction. Each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance. Returns the updated account balance.
#   - Does not allow the account to go negative. Will output a warning message and return the original un-modified balance
# - `#withdraw_using_check(amount)`: The input amount gets taken out of the account as a result of a check withdrawal. Returns the updated account balance.
#   - Allows the account to go into overdraft up to -$10 but not any lower
#   - The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee