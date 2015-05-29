require './lib/bank_account/account'
require 'spec_helper.rb'
# root folder do rspec..
describe BankAccount::Account do

  it "responds to class method called new" do
    expect(BankAccount::Account).to respond_to :new
  end

  it "expects initial balance to equal current balance" do
    BankAccount::Account.new(100,200)
    expect(BankAccount::Account.new(100,200).balance).to eq (200)
  end

  let (:new_account) {BankAccount::Account.new(100, 200)}
  it "creates Account & passes parameters correctly" do
    expect(new_account).to be_a(BankAccount::Account) #initializer that i ran is actually working/instance of BankAccount
    expect(new_account.id).to eq(100)
    expect(new_account.balance).to eq(200)
  end

  it "raises ArgumentError for initial balance below 0"  do
    expect {
      BankAccount::Account.new(100,-1)
    }.to raise_exception("You can't start out with a negative balance. Add some monies")
  end

  it "deposits correctly" do
    new_account3 = BankAccount::Account.new(100, 200)
    expect(new_account3.deposit(20)).to eq(220)
  end

  it "withdraws correctly" do
    new_account2 = BankAccount::Account.new(100, 200)
    expect(new_account2.withdraw(20)).to eq(180)
  end

  it "can't withdraw more than your current balance" do
    new_account3 = BankAccount::Account.new(100, 200)
    expect(new_account3.withdraw(201)).to eq("You can't overdraw. Your balance is 0.")
  end

  let (:new_account4) {BankAccount::Account.new(100, 200)}
  it "returns the current balance after each withdraw/deposit" do
    expect(new_account4.withdraw(100)).to eq(100)
    expect(new_account4.deposit(50)).to eq(150)
  end

end
