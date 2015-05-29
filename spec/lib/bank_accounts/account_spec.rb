require "spec_helper"
require "bank_accounts"

describe BankAccounts::Account do
  it "responds to class method called new" do
    expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
  end

  it "returns the initial balance that was set in initialize" do
    account = BankAccounts::Account.new(4, 100)
    expect(account.initial_balance).to eq(100)
  end

  it "raises an ArgumentError if negative number is passed for initial_balance" do
    expect { BankAccounts::Account.new(4, -500) }.to raise_exception(ArgumentError)
  end

  context "When #withdraw is called" do
    before :each do
      @account = BankAccounts::Account.new(1, 1000)
    end

    it "removes the input amount from the balance" do
      @account.withdraw(500)
      expect(@account.initial_balance).to eq(500)
    end

    it "does not allow the account to go negative" do
      expect(@account.withdraw(1500)).to eq("Insufficient funds to remove this amount. Please try a smaller amount.")
    end
  end


end #describe
