require 'bankaccounts'
require 'pry'
require 'spec_helper'

describe BankAccount::Account do

  describe "It is initialized with assignments" do
    let (:bankaccount) {BankAccount::Account.new(1, 10000)}

    it "has an ID of 1" do
      expect(bankaccount.id).to eq(1)
    end

    it "has an initial balance of 10000" do
      expect(bankaccount.initial_balance).to eq(10000)
    end

    it "raises an ArgumentError if a negative account balance is initialized" do
      expect{BankAccount::Account.new(3, -5000)}.to raise_error(ArgumentError)
    end
  end

  describe "It has instance methods with functionality" do
    let (:bankaccount) {BankAccount::Account.new(2, 10000)}

    it "Returns a balance of 5000 when 5000 is withdrawn" do
      expect(bankaccount.withdraw(5000)).to eq(5000)
    end

    it "Returns a warning and original balance if withdrawal is greater than balance amount" do
      expect(bankaccount.withdraw(20000)).to eq(10000)
    end

    it "Returns a balance of 15000 when 5000 is deposited" do
      expect(bankaccount.deposit(5000)).to eq(15000)
    end

    it "Balance method shows current balance" do
      # added #withdraw to show #balance was returning current balance
      bankaccount.withdraw(2000)
      expect(bankaccount.balance).to eq(8000)
    end
  end
end
