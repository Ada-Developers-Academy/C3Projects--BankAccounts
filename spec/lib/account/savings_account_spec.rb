require 'spec_helper'
require 'bank_accounts'

describe "BankAccounts::SavingsAccount" do
  context "self.new(id, initial_balance)" do

    subject { BankAccounts::SavingsAccount.new(123, 1000) }

    it "responds to SavingsAccount class" do
      expect(BankAccounts::SavingsAccount).to respond_to(:new).with(2).arguments
    end

    it "assigns an id" do
      expect(subject.id).to eq(123)
    end

    it "assigns an initial balance" do
      expect(subject.balance).to eq(1000)
    end

    it "raises error when initial balance is below 10" do
      expect{BankAccounts::SavingsAccount.new(123, 5)}.to raise_error("Must have minimum balance of $10")
    end

    it "raises error when initial balance is below 0" do
      expect{BankAccounts::SavingsAccount.new(123, -1)}.to raise_error("Balance needs to be greater than $0")
    end

    it "raises error when id is not a number" do
      expect{BankAccounts::SavingsAccount.new("abc", 20)}.to raise_error("Parameter must be a number")
    end

    it "raises error when initial balance is not a number" do
      expect{BankAccounts::SavingsAccount.new(12345, "20")}.to raise_error("Parameter must be a number")
    end
  end

  context ".withdraw(amount)" do
    subject { BankAccounts::SavingsAccount.new(1234, 6000) }

    it "responds to SavingsAccount instance" do
      expect(subject).to respond_to(:withdraw).with(1).arguments
    end

    it "subtracts given amount along with transaction fee of 2" do
      expect(subject.withdraw(98)).to eq(5900)
    end

    it "returns original balance if withdraw amount brings the balance below 10" do
      expect(subject.withdraw(5995)).to eq(6000)
    end
  end

  context ".add_interest(rate)" do
    subject { BankAccounts::SavingsAccount.new(54321, 1000) }

    it "responds to SavingsAccount instance" do
      expect(subject).to respond_to(:add_interest).with(1).arguments
    end

    it "returns the calculated interest rate on the balance" do
      expect(subject.add_interest(0.25)).to eq(2.5)
    end

    it "adds the calculated interest rate to the balance" do
      subject.add_interest(0.25)

      expect(subject.balance).to eq(1002.5)
    end

    it "raises error when rate is less than 0" do
      expect{ subject.add_interest(-1) }.to raise_error
    end
  end
end
