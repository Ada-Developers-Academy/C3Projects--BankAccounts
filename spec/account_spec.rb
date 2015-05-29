require "spec_helper"
require "./lib/banks/account"

describe "Account class" do
  context "Making a new instance of Account" do
    it "responds to class method called new" do
      expect(BankAccount::Account).to respond_to :new
    end

    it "is an instance of the Account class" do
      new_account = BankAccount::Account.new(3, 100)
      expect(new_account.class).to be(BankAccount::Account)
    end
    context "You cannot make an account with a negative initial_balance" do
      it "should raise an ArgumentError if you start an account with a negative initial_balance" do
        expect {BankAccount::Account.new(4, -10)}.to raise_error(ArgumentError)
      end

      it "should not raise an error if you start an account with a zero balance" do
        expect {BankAccount::Account.new(3, 0)}.not_to raise_error
      end
    end
  end

  context "Taking money out of the account by subtracting the withdrawl amount" do
    account = BankAccount::Account.new(10, 1000)
    it "returns the updated balance" do
      expect(account.withdraw(100)).to eq(900)
    end

    it "does not allow the account to go negative - outputs warning and returns previous balance" do
      expect{account.withdraw(1100)}.to output("WARNING: This account cannot go below zero.\n").to_stdout
      expect(account.withdraw(1100)).to eq(900) # the previous balance is 900 because of the last test (we withdrew 100)
    end
  end

  context "Adding money to the account" do
    account = BankAccount::Account.new(25, 100)
    it "returns the updated balance by adding the deposited amount" do
      expect(account.deposit(250)).to eq(350)
    end
  end

  it "returns the current_balance" do
    account = BankAccount::Account.new(30, 97)
    account.deposit(375)
    account.withdraw(62)
    expect(account.balance).to eq(410)
  end
end
