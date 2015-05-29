require "spec_helper"
require "bank_accounts"

describe BankAccounts::SavingsAccount do
  it "responds to class method called new" do
    expect(BankAccounts::SavingsAccount).to respond_to(:new).with(2).arguments
  end

  it "raises an error when initial_balance is less than $10" do
    expect { BankAccounts::SavingsAccount.new(4, 9) }.to raise_exception(ArgumentError)
  end

end

describe "SavingsAccount methods will: " do
  before :each do
    @account = BankAccounts::SavingsAccount.new(1, 1000)
  end

  context "when #withdraw is called" do
    it "it subtracts input amount from balance, plus $2 withdrawal fee" do
      @account.withdraw(500)
      expect(@account.balance).to eq(498)
    end

    it "will not allow account to get below $10 min balance" do
      expect(@account.withdraw(990)).to eq("Insufficient funds. Please withdraw a smaller amount.")
    end

  end










end #describle



