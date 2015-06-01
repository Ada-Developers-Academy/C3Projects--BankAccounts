require 'spec_helper'
require 'bank_accounts'

describe "BankAccounts::MoneyMarketAccount" do
  context "self.new(id, initial_balance)" do

    subject { BankAccounts::MoneyMarketAccount.new(60543, 10000) }

    it "responds to Account class" do
      expect(BankAccounts::MoneyMarketAccount).to respond_to(:new).with(2).arguments
    end

    it "assigns an id" do
      expect(subject.id).to eq(60543)
    end

    it "assigns an initial balance" do
      expect(subject.balance).to eq(10000)
    end

    it "raises error message when initial balance is less than 10,000" do
      expect{ BankAccounts::MoneyMarketAccount.new(60543, 1000) }.to raise_error("Must have minimum balance of $10000")
    end

    it "raises error when the id is not a number" do
      expect{ BankAccounts::MoneyMarketAccount.new("abc", 1000) }.to raise_error("Parameter must be a number")
    end

    it "raises an error when the intial balance is not a number" do
      expect{ BankAccounts::MoneyMarketAccount.new(1232154, "1000") }.to raise_error("Parameter must be a number")
    end
  end

  context ".withdraw(amount)" do
    subject { BankAccounts::MoneyMarketAccount.new(123, 15000) }

    it "responds to instance of Account class" do
      expect(subject).to respond_to(:withdraw).with(1).arguments
    end

    it "subtracts given amount from balance" do
      expect(subject.withdraw(1000)).to eq(14000)
    end

    it "returns the original balance when withdraw amount exceeds balance" do
      expect(subject.withdraw(16000)).to eq(15000)
    end

    # STILL WORKING ON THESE SPECS 
    # it "subtracts given amount and $100 fee when withdrawal causes balance to go below $10000" do
    #   expect(subject.withdraw(11000)).to eq(3900)
    # end
    #
    # it "raises an error when transaction count has exceeded 6" do
    #   subject.transactions_count = 7
    #   expect(subject.withdraw(300)).to eq(15000)
    # end

    it "raises error when amount is not an integer" do
      expect{ subject.withdraw("blah") }.to raise_error("Parameter must be a number")
    end


  end
end
