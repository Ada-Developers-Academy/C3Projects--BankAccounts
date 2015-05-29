require './spec/spec_helper'
require './lib/bank_accounts/checking_account'

describe BankAccounts::Account do

  describe "class methods" do

    context "when balance would be negative" do
      it "throws an error and aborts savings account creation" do
        expect { BankAccounts::CheckingAccount.new(1, -1) }.to raise_error(ArgumentError, "Checking account can't have a negative balance. Create a new account.")
      end
    end

  end # class methods


  describe "attributes" do
    let(:checking_account) { BankAccounts::CheckingAccount.new(1, 2) }

    it "has initial balance" do
      expect(checking_account.balance).to eq(2)
    end

    it "has id" do
      expect(checking_account.id).to eq(1)
    end
  end # attributes


  describe "instance methods" do
    let(:checking_account) { BankAccounts::CheckingAccount.new(1, 2) }

    it "deposits money" do
          expect(checking_account.deposit(8)).to eq(10)
      end

    it "won't accept negative deposits" do
      expect(checking_account.deposit(-1)).to eq(2)
    end

    it "withdraws money with fee" do
      expect(checking_account.withdraw(1)).to eq(0)
    end

    it "won't withdraw too much money with fee" do
      expect(checking_account.withdraw(2)).to eq(2)
    end

  end


end
