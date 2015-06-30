require "spec_helper"
require "bank_accounts"

describe BankAccounts::Account do
  it "responds to class method called new" do
    expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
  end

  it "raises an ArgumentError if negative number is passed for initial_balance" do
    expect { BankAccounts::Account.new(4, -500) }.to raise_exception(ArgumentError)
  end

  before :each do
      @account = BankAccounts::Account.new(1, 1000)
  end

  it "#balance returns the account balance" do
    expect(@account.balance).to eq(1000)
  end

  context "#withdraw will: " do
    it "subtract the input amount from the balance and return the balance" do
      expect(@account.withdraw(400)).to eq(600)
    end

    it "not allow the account to go negative and will return the original balance" do
      expect(@account.withdraw(1500)).to eq(1000)
    end
  end

  context "#deposit will: " do
    it "add input value to balance and returns balance" do
      expect(@account.deposit(500)).to eq(1500)
    end
  end
end #describe
