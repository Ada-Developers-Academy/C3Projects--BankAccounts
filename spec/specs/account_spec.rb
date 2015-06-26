require 'spec_helper'
require 'bank_accounts'

describe BankAccount::Account do

  context "when .new is called" do
    it "checks if it has two parameters" do
      expect(BankAccount::Account).to respond_to(:new).with(2).arguments
    end

    it "accepts no negatives for initial balance" do
    expect{(BankAccount::Account.new("carjug", -7))}.to raise_error(ArgumentError)
    end
  end
end

describe BankAccount::Account do
  before :each do
    @account = BankAccount::Account.new("carjug", 10)
  end

  context "when #withdraw method is called" do
    it "has a #withdraw method" do
      expect(@account).to respond_to(:withdraw)
    end

    it "checks if it has one parameter" do
      expect(@account).to respond_to(:withdraw).with(1).arguments
    end

    it "does not allow the account to go negative" do
      expect{@account.withdraw(15)}.to raise_error(ArgumentError)
    end

    it "returns :initial_balance" do
      expect(@account.withdraw(4)).to eq(6)
    end
  end

  context "when #deposit method is called"do
    it "has a #withdraw method" do
      expect(@account).to respond_to(:deposit)
    end

    it "checks if it has one parameter" do
      expect(@account).to respond_to(:deposit).with(1).arguments
    end

    it "returns :initial_balance" do
      expect(@account.deposit(4)).to eq(14)
    end
  end

  context "when #balance method is called" do
    it "has a #balance method" do
      expect(@account).to respond_to(:balance)
    end

    it "returns current balance" do
      expect(@account.balance).to eq(10)
    end
  end
end



