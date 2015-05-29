require './spec/spec_helper'
require './lib/bank_accounts/account'

describe BankAccounts::Account do


  describe "class methods" do

    context "when balance would be negative" do
      it "throws an error and aborts account creation" do
        expect { BankAccounts::Account.new(1, -10) }.to raise_error(ArgumentError, "Account can't have a negative balance. Create a new account.")
      end
    end

  end # class methods


  describe "attributes" do
    let(:account) { BankAccounts::Account.new(1, 10) }

    it "has initial balance" do
      expect(account.balance).to eq(10)
    end

    it "has id" do
      expect(account.id).to eq(1)
    end
  end # attributes


  describe "instance methods" do
    let(:account) { BankAccounts::Account.new(1, 10) }

    it "deposits money" do
      expect(account.deposit(10)).to eq(20)
    end

    it "won't accept negative deposit" do
      expect(account.deposit(-10)).to eq(10)
    end

    it "withdraws money" do
      expect(account.withdraw(10)).to eq(0)
    end

    it "won't withdraw too much money" do
      expect(account.withdraw(11)).to eq(10)
    end


  end # instance methods


end # Account
