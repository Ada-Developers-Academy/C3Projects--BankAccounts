require 'spec_helper'
require 'bank_accounts'

describe BankAccounts::Account do

  context "When creating a bank account" do
    it "responds to Account instantiation with 2 arguments" do
      expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
    end

    it "raises an error when an account is created with a negative balance" do
      expect{ BankAccounts::Account.new(0, -1) }.to raise_error(ArgumentError, "Sorry, you can't start an account with a negative balance.")
    end

    it "rounds initial balance floats > longer than 2 decimal spots, down to 2" do
      account = BankAccounts::Account.new(0, 10.2599)
      expect(account.balance).to eq(10.25)
    end
  end

  context "When withdrawing money from bank account" do
    let(:account) { BankAccounts::Account.new(0, 200) }

    it "returns an updated account balance when withdrawing money" do
      expect(account.withdraw(10)).to eq(190)
      expect(account.withdraw(40)).to eq(150)
    end

    it "raises an error when the account is overdrawn" do
      expect{account.withdraw(500)}.to raise_error(ArgumentError, "INSUFFICIENT FUNDS\nYour current balance is $#{account.balance}.")
    end
  end

  context "When depositing money into the bank account" do
    let(:account) { BankAccounts::Account.new(0, 500) }

    it "responds to deposit(amount)" do
      expect(account).to respond_to(:deposit)
    end

    it "returns an updated account balance when depositing money" do
      expect(account.deposit(50)).to eq(550)
      expect(account.deposit(150)).to eq(700)
    end
  end

  context "When checking account balance" do
    let(:account) { BankAccounts::Account.new(0, 10000) }

    it "responds to balance" do
      expect(account).to respond_to(:balance)
    end

    it "returns the current balance" do
      expect(account.balance).to eq(10000)
    end
  end

end # describe