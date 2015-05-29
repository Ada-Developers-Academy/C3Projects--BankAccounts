require './lib/bank_account/account'
require 'spec_helper.rb'

describe BankAccount::Account do

  it "responds to class method called new" do
    expect(BankAccount::Account).to respond_to :new
  end

  let (:new_account) {BankAccount::Account.new(100, 200)}
  it "creates bank account & passes parameters correctly" do
    expect(new_account).to be_a(BankAccount::Account) #initializer that i ran is actually working/instance of BankAccount
    expect(new_account.id).to eq(100)
    expect(new_account.initial_balance).to eq(200)

  end

  it "raises ArgumentError for balance below 0"  do
    expect {
      BankAccount::Account.new(100,-1)
    }.to raise_exception("Balance can't be below 0")
  end

end
