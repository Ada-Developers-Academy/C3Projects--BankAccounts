require 'spec_helper'

describe BankAccounts::Account do

    it "responds to #new" do
      expect(BankAccounts::Account).to respond_to :new
    end

    it "raises an ArgumentError if initial_balance is negative" do
      expect{ BankAccounts::Account.new("name", -3) }.to raise_error(ArgumentError, "Only positive initial balances allowed")
    end

    before :each do
      @account = BankAccounts::Account.new("Name", 100)
    end

    it "returns 70 when #withdraw 30 is called on initial balance of 100" do
      expect(@account.withdraw(30)).to eq(70)
    end

    it "returns unmodified balance if withdraw would make balance negative" do
      expect(@account.withdraw(110)).to eq(100)
    end

    it "returns updated balance of 120 with deposit of 20" do
      expect(@account.deposit(20)).to eq(120)
    end

    it "returns current balance 100 if #balance is called" do
      expect(@account.balance).to eq(100)
    end

    
end
