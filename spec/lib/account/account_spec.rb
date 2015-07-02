require 'spec_helper'
require 'bank_accounts'

describe "BankAccounts::Account" do
  context "self.new(id, initial_balance)" do

    subject { BankAccounts::Account.new(60543, 1000) }

    it "responds to Account class" do
      expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
    end

    it "assigns an id" do
      expect(subject.id).to eq(60543)
    end

    it "assigns an initial balance" do
      expect(subject.balance).to eq(1000)
    end

    it "raises error message when initial balance is negative" do
      expect{ BankAccounts::Account.new(60543, -1000) }.to raise_error("Balance needs to be greater than $0")
    end

    it "raises error when the id is not a number" do
      expect{ BankAccounts::Account.new("abc", 1000) }.to raise_error("Parameter must be a number")
    end

    it "raises an error when the intial balance is not a number" do
      expect{ BankAccounts::Account.new(1232154, "1000") }.to raise_error("Parameter must be a number")
    end
  end

  context ".withdraw(amount)" do

    subject { BankAccounts::Account.new(123, 500) }

    it "responds to instance of Account class" do
      expect(subject).to respond_to(:withdraw).with(1).arguments
    end

    it "subtracts given amount from balance" do
      expect(subject.withdraw(100)).to eq(400)
    end

    it "returns the original balance when withdraw amount exceeds balance" do
      expect(subject.withdraw(2000)).to eq(500)
    end

    it "raises error when amount is not an integer" do
      expect{ subject.withdraw("blah") }.to raise_error("Parameter must be a number")
    end
  end

  context ".deposit(amount)" do

    subject { BankAccounts::Account.new(123123, 200) }

    it "adds given amount to the balance" do
      expect(subject.deposit(200)).to eq(400)
    end

    it "raises error when amount is negative" do
      expect{ subject.deposit(-100) }.to raise_error("Cannot pass in negative argument")
    end
  end

  context ".balance" do

    subject { BankAccounts::Account.new(6542, 9000) }

    it "returns current balance" do
      expect(subject.balance).to eq(9000)
    end
  end
end
