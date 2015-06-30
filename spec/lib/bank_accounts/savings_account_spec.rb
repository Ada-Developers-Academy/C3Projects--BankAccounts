require "spec_helper"
require "bank_accounts"

describe BankAccounts::SavingsAccount do
  it "responds to class method called new" do
    expect(BankAccounts::SavingsAccount).to respond_to(:new).with(2).arguments
  end

  it "raises an error when initial_balance is less than $10" do
    expect { BankAccounts::SavingsAccount.new(4, 9) }.to raise_exception(ArgumentError)
  end

  before :each do
    @account = BankAccounts::SavingsAccount.new(1, 1000)
  end

  context "SavingsAccount methods will: " do
    it "inherit #deposit from parent Account" do
      @account.deposit(1000)
      expect(@account.balance).to eq(2000)
    end
  end

  context "when #withdraw is called" do
    it "it subtracts input amount from balance, plus $2 withdrawal fee" do
      @account.withdraw(500)
      expect(@account.balance).to eq(498)
    end

    it "will not allow account to get below $10 min balance" do
      expect(@account.withdraw(990)).to eq(1000)
    end
  end

  context "when #add_interest is called" do
    it "calculates rate, adds interest to balance, and returns amount of interest accrued" do
      expect(@account.add_interest(0.15)).to be(1.5)
    end

    it "returns error message if rate is negative" do
      expect(@account.add_interest(-0.15)).to eq("Rate must be a positive percentage.")
    end
  end
end #describle



