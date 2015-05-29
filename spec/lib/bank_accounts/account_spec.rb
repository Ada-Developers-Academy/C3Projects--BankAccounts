require "spec_helper"
require "bank_accounts"

describe BankAccounts::Account do
  it "responds to class method called new" do
    expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
  end

  it "raises an ArgumentError if negative number is passed for initial_balance" do
    expect { BankAccounts::Account.new(4, -500) }.to raise_exception(ArgumentError)
  end

end

describe "For the following class methods:" do
  before :each do
      @account = BankAccounts::Account.new(1, 1000)
    end

  it "#balance returns the account balance" do
    expect(@account.balance).to eq(1000)
  end

  context "When #withdraw is called" do
    it "removes the input amount from the balance" do
      @account.withdraw(500)
      expect(@account.balance).to eq(500)
    end

    it "does not allow the account to go negative" do
      expect(@account.withdraw(1500)).to eq("Insufficient funds to remove this amount. Please try a smaller amount.")
    end
  end

  context "When #deposit is called" do
    it "adds input value to balance" do
      @account.deposit(500)
      expect(@account.balance).to eq(1500)
    end
  end
end #describe
