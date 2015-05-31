require 'spec_helper'
require 'bank_accounts'

describe BankAccounts::MoneyMarketAccount do

 context "A money market account is a bank account" do
   it "MoneyMarket class inherits from Account class" do
     expect(BankAccounts::MoneyMarketAccount.superclass).to eq(BankAccounts::Account)
   end
 end

 context "When creating a money market account" do
  it "raises an error when instantiating a money market account with a balance below $10,000" do
    expect{ BankAccounts::MoneyMarketAccount.new(0, 10) }.to raise_error(ArgumentError, "MINIMUM BALANCE $10000 REQUIRED")
  end
 end

 context "When withdrawing from a money market account" do
  let (:money_market) { BankAccounts::MoneyMarketAccount.new(0, 20000) }

  it "returns an updated account balance after withdrawing" do
    expect(money_market.withdraw(200)).to eq(19800)
    expect(money_market.withdraw(4800)).to eq(15000)
  end
end

 context "Only 6 transactions/month are alowed for Money Market accounts" do
  let (:money_market) { BankAccounts::MoneyMarketAccount.new(0, 1000) }

  it "raises an error if > 6 total transactions (deposits or withdrawals) are made" do
    3.times { money_market.deposit(10) }
    3.times { money_market.withdraw(20) }
    expect(money_market.deposit(100)).to raise_error(ArgumentError, "TOTAL MONTHLY TRANSACTIONS EXCEEDED - only 6 transactions allowed per month.")
    expect(money_market.withdraw(100)).to raise_error(ArgumentError, "TOTAL MONTHLY TRANSACTIONS EXCEEDED - only 6 transactions allowed per month.")
  end
 end

end # describe

# Create a `MoneyMarketAccount` class with a minimum of 6 specs. The class should inherit behavior from the `Account` class.
# - A maximum of 6 transactions (deposits or withdrawals) are allowed per month on this account type
# - `self.new(id, initial_balance)`: creates a new instance with the instance variable `id` and 'initial_balance' assigned
#   - The initial balance cannot be less than $10,000 - this will `raise` an `ArgumentError`
# - `#withdraw(amount)`: The input amount gets taken out of the account as result of an ATM transaction. Returns the updated account balance.
#   - If a withdrawal causes the balance to go below $10,000, a fee of $100 is imposed and no more transactions are allowed until the balance is increased using a deposit transaction.
#   - Each transaction will be counted against the maximum number of transactions
# - `#deposit(amount)`. Returns the updated account balance.
#   - Each transaction will be counted against the maximum number of transactions
#   - Exception to the above: A deposit performed to reach or exceed the minimum balance of $10,000 is not counted as part of the 6 transactions.
# - `#add_interest(rate)`: Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance). Note** This is the same as the `SavingsAccount` interest.
# - `#reset_transactions`: Resets the number of transactions to zero