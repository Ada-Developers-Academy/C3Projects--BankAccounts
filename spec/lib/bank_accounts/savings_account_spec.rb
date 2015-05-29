require './spec/spec_helper'
require './lib/bank_accounts/savings_account'

describe BankAccounts::SavingsAccount do


  describe "class methods" do

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
    let(:savings_account) { BankAccounts::SavingsAccount.new(1, 10_000) }

    it "deposits money" do
        expect(savings_account.deposit(100)).to eq(10_100)
      end

    it "withdraws money with fee" do
      expect(savings_account.withdraw(100)).to eq(9_898)
    end

    it "won't withdraw too much money with fee" do
      expect(savings_account.withdraw(10_000)).to eq(10_000)
    end

    it "adds and returns interest" do
      expect(savings_account.add_interest(0.25)).to eq(25)
    end

    it "wont add too much negative interest" do
      expect(savings_account.add_interest(-100)).to eq(10_000)
    end

  end # instance methods


end # SavingsAccount
