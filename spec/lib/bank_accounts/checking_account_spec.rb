require "spec_helper"
require "bank_accounts"

describe BankAccounts::CheckingAccount do
  it "responds to class method called new" do
    expect(BankAccounts::CheckingAccount).to respond_to(:new).with(2).arguments
  end

  before :each do
    @account = BankAccounts::CheckingAccount.new(1, 1000)
  end

  it "inherits balance from parent Account" do
    expect(@account.balance).to eq(1000)
  end

  context "#withdraw method will" do
    it "subtracts input amount from balance and charges $1 transaction fee" do
      expect(@account.withdraw(500)).to eq(499)
    end

    it "does not allow the account to go negative"do
      expect(@account.withdraw(1001)).to eq("Insufficient funds. Please withdraw a smaller amount.")
    end
  end






end #describe


