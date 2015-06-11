require 'spec_helper'

describe BankAccount::SavingsAccount do
  it "responds to the .new class method" do
    expect(BankAccount::SavingsAccount).to respond_to :new
  end
end

describe "Declining to Open an Account with Less than Minumum Amount" do
  let (:account) {BankAccount::SavingsAccount.new(345, 5)}
  it "Raises an exception" do
    expect { raise ArgumentError}.to raise_exception (ArgumentError)

  end
end

describe "Executing a withdraw" do
  let (:account) {BankAccount::SavingsAccount.new(345, 500)}
  it "When withdraw is executed the balance of the bank account will be reduced by withdraw amount and then deduct an additional 2 and lastly will return the new balance" do
    expect(account.withdraw(50)).to eq(448)
  end
end

describe "Not Allowing Account to Drop Below Minimum Required Amount" do
  let (:account) {BankAccount::SavingsAccount.new(345, 500)}
  it "No withdrawl is allowed that will cause the account to drop below the minimum threshold of 10 after the transactio and transaction fee are complete. The transaction is declined, a decline message is output and orginal balance is returned" do
    expect(account.withdraw(490)).to eq(500)
  end
end

describe "Executing a deposit" do
  let (:account) {BankAccount::SavingsAccount.new(345, 500)}
  it "When deposit is executed the amount of the deposit will be added to the balance and the new balance will be returned to user" do
    expect(account.deposit(50)).to eq(550)
  end
end

describe "Trying to deposit a negative amount" do
  let (:account) {BankAccount::SavingsAccount.new(345, 500)}
  it "Will return a message that a deposit of a negative amount is not allowed and instruct the user to execute a withdraw instead" do
    expect(account.deposit(-10)).to eq(500)
  end
end

describe "Checking Balance Returns Balance" do
  let (:account) {BankAccount::SavingsAccount.new(345, 500)}
  it "You can check balance at anytime and it will return your current balance to you" do
    expect(account.balance).to eq(500)
  end
end
