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
      expect{ BankAccounts::Account.new(60543, -1000) }.to raise_error("Cannot have negative number for initial balance")
    end
  end

  context ".withdrawl(amount)" do
    subject { BankAccounts::Account.new(123, 1000) }

    it "is a valid method for Account class" do
      expect(subject).to respond_to(:withdrawl).with(1).arguments
    end

    it "subtracts given amount from balance" do
      expect(subject.withdrawl(100)).to eq(900)
    end

    it "returns the original balance when withdrawl amount exceeds balance" do
      expect(subject.withdrawl(2000)).to eq(1000)
    end
  end

  context ".deposit(amount)" do
    subject { BankAccounts::Account.new(123, 1000) }

    it "adds given amount to the balance" do
      expect(subject.deposit(200)).to eq(1200)
    end

    it "raises error when amount is negative" do
      expect{ subject.deposit(-100) }.to raise_error("Cannot have negative number for initial balance")
    end
  end

  context ".balance" do
    subject { BankAccounts::Account.new(123, 1000) }
    
    it "returns current balance" do
      expect(subject.balance).to eq(1000)
    end
  end
end
