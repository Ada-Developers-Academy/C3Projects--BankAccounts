require 'bankaccounts'
require 'pry'
require 'spec_helper'

describe BankAccount::SavingsAccount do

  describe "It is initialized with assignments" do
    let (:bankaccount) {BankAccount::SavingsAccount.new(1, 10000)}

    it "has an ID of 1" do
      expect(bankaccount.id).to eq(1)
    end

    it "has an initial balance of 10000" do
      expect(bankaccount.initial_balance).to eq(10000)
    end

    it "inherits balance method from Account class" do
      expect(bankaccount.balance).to eq(10000)
    end

    it "raises an ArgumentError if a account of 8 is initialized" do
      expect{BankAccount::SavingsAccount.new(3, 8)}.to raise_error(ArgumentError)
    end
  end

  describe "It has instance methods with functionality" do
    let (:bankaccount) {BankAccount::SavingsAccount.new(33, 500)}

    it "Withdrawing money incurs a $2 fee" do
      expect(bankaccount.withdraw(48)).to eq(450)
    end

    it "Must leave $10 in savings account, puts warning, returnd original amount" do
      expect(bankaccount.withdraw(495)).to eq(500)
    end

    it "Returns $2.50 interest with an interest rate of 0.5%" do
      expect(bankaccount.add_interest(0.5)).to eq(2.50)
    end
  end
end
