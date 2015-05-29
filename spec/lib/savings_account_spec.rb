require './lib/bank_account/savings_account'
require 'spec_helper.rb'

describe BankAccount::SavingsAccount do

  it "responds to class method called new" do
    expect(BankAccount::SavingsAccount).to respond_to :new
  end

  it "expects initial SA balance to equal current balance" do
    BankAccount::SavingsAccount.new(100,200)
    expect(BankAccount::SavingsAccount.new(100,200).balance).to eq (200)
  end

  let (:new_account) {BankAccount::SavingsAccount.new(100, 200)}
  it "creates Savings Account & passes parameters correctly" do
    expect(new_account).to be_a(BankAccount::SavingsAccount) #initializer that i ran is actually working/instance of BankAccount
    expect(new_account.id).to eq(100)
    expect(new_account.balance).to eq(200)
  end

  it "raises ArgumentError for initial SA balance below 10"  do
    expect {
      BankAccount::SavingsAccount.new(100,9)
    }.to raise_exception("You can't start out with a balance below $10. Add moar monies.")
  end

  it "deposits to SA correctly" do
    new_account3 = BankAccount::SavingsAccount.new(100, 200)
    expect(new_account3.deposit(20)).to eq(220)
  end

end
