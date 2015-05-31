require "spec_helper"
require "./lib/bank_accounts/account"

describe BankAccount::Account  do

  describe "class method" do
    it "responds to 'new'" do
    expect(BankAccount::Account).to respond_to :new
    end

    it "raises ArgumentError, if wrong number of arguments" do
      expect{BankAccount::Account.new(2)}.to raise_error(ArgumentError)
    end

    it "raises ArgumentError, if balance is negative" do
      expect{BankAccount::Account.new(2, -20)}.to raise_error(ArgumentError)
    end

    it "raises ArgumentError, if invalid input" do
      expect{BankAccount::Account.new("hello", 20)}.to raise_error(ArgumentError)
      expect{BankAccount::Account.new(44, "bye")}.to raise_error(ArgumentError)
    end
  end

  describe "attributes" do
    let(:account) {BankAccount::Account.new(3, 300)}

    it "checks that account has id 3" do
      expect(account.id).to eq 3
    end

    it "checks that account has balance $300" do
      expect(account.balance).to eq 300
    end
  end

  describe "withdraw method" do
   let(:account) {BankAccount::Account.new(5, 500)}

    it "withdraws $300 and returns updated balance $200" do
      expect(account.withdraw(300)).to eq 200
    end

    it "returns last updated balance if withdraw amount is bigger than balance" do
      expect(account.withdraw(100)).to eq 400
      expect(account.withdraw(600)).to eq 400
    end
  end

  describe "deposti method" do
   let(:account) {BankAccount::Account.new(5, 500)}

    it "adds $500 and returns updated balance $1000" do
      expect(account.deposit(500)).to eq 1000
    end
  end

  describe "balance method" do
   let(:account) {BankAccount::Account.new(5, 500)}

    it "returns the current balance $1000" do
      account.deposit(500)
      expect(account.balance).to eq 1000
    end
  end
end
