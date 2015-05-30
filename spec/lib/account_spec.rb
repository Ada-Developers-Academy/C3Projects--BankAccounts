require './lib/bank_account/account'
require 'spec_helper.rb'
# root folder do rspec..
describe BankAccount::Account do
  let (:new_account200) {BankAccount::Account.new(100, 200)}

  it "responds to class method called new" do
    expect(BankAccount::Account).to respond_to :new
  end

  it "expects initial balance to equal current balance" do
    expect(new_account200.balance).to eq (200)
  end

  it "creates Account & passes parameters correctly" do
    expect(new_account200).to be_a(BankAccount::Account) #initializer that i ran is actually working/instance of BankAccount
    expect(new_account200.id).to eq(100)
    expect(new_account200.balance).to eq(200)
  end

  it "raises ArgumentError for initial balance below 0"  do
    expect {
      BankAccount::Account.new(100,-1)
    }.to raise_exception("You can't start out with a negative balance. Add some monies")
  end

  it "withdraws correctly" do
    expect(new_account200.withdraw(200)).to eq(0)
  end

  it "can't withdraw more than your current balance & returns unmodified balance" do
    expect(new_account200.withdraw(201)).to eq(200)
  end

  it "deposits correctly" do
    expect(new_account200.deposit(20)).to eq(220)
  end

  it "returns the current balance after each withdraw or deposit" do
    expect(new_account200.withdraw(100)).to eq(100)
    expect(new_account200.deposit(500)).to eq(600)
  end

end
