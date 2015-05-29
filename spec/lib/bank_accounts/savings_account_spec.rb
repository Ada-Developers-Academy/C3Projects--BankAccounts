require './spec/spec_helper'
require './lib/bank_accounts/savings_account'

describe BankAccounts::SavingsAccount do


  describe "class methods" do

    it "responds to 'new'" do
      expect(BankAccounts::SavingsAccount).to respond_to :new
    end

    context "when balance would be under 10" do
      it "throws an error and aborts savings account creation" do
        expect { BankAccounts::SavingsAccount.new(1, 9) }.to raise_error(ArgumentError, "Savings account balance must be at least $10. Create a new savings account.")
      end
    end

  end # class methods


  describe "attributes" do
    let(:savings_account) { BankAccounts::SavingsAccount.new(1, 10) }

    it "has initial balance" do
      expect(savings_account.balance).to eq(10)
    end

    it "has id" do
      expect(savings_account.id).to eq(1)
    end
  end # attributes


  describe "instance methods" do
    let(:savings_account) { BankAccounts::SavingsAccount.new(1, 20) }

    it "deposits money" do
        expect(savings_account.deposit(10)).to eq(30)
      end

      it "withdraws money with fee" do
        expect(savings_account.withdraw(5)).to eq(13)
      end

      it "won't withdraw too much money with fee" do
        expect(savings_account.withdraw(10)).to eq(20)
      end

  end # instance methods


end # SavingsAccount
