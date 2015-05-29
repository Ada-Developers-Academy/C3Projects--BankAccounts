require 'spec_helper'


##note to self: class methods need module::class and instance methods need lowercaseclass.methodname
describe "account attributes" do
  context "responds to the account class" do
    it "responds to the function new for Account" do
      expect(BankAccount::Account).to respond_to :new
    end
  end

  context "the user cannot open an account with a negative balance" do
    it "raises an error" do
      expect{BankAccount::Account.new(1,-5)}.to raise_error(ArgumentError)
    end
  end
end

describe "instance methods" do
  let(:account) { BankAccount::Account.new(1,250)}

  context "withdraw method removes money from account and returns updated balance" do
    it "returns an updated balance of 45.00" do
    expect(account.withdraw(205)).to eq(45)
    end
  end

  context "cannot overdraw account" do
    it "returns the balance before the withdraw attempt" do
    expect(account.withdraw(251)).to eq(250)
    end
  end

  context "deposit method adds money to account and returns updated balance" do
    it "returns the updated balance of 500" do
      expect(account.deposit(250)).to eq(500)
    end
  end

  context "bank cannot process deposits of more than $2 million" do
    it "returns the balance before the deposit attempt" do
    expect(account.deposit(2_100_000)).to eq(250)
    end
  end

  context "user can check balance at anytime" do
    it "returns the current balance" do
      expect(account.balance).to eq(250)
    end
  end
end
