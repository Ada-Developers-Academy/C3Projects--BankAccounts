require 'spec_helper'
require 'bank_accounts'

describe BankAccounts::SavingsAccount do
  
  context "A savings account is a bank account" do
    it "inherits from class Account" do
      expect(BankAccounts::SavingsAccount.superclass).to eq(BankAccounts::Account)
    end
  end

  context "When creating a savings bank account" do
    it "responds to savings account instantiation with 2 arguments" do
      expect(BankAccounts::SavingsAccount).to respond_to(:new).with(2).arguments
    end

    it "raises an error when instantiating a savings account with a balance below $10" do
      expect{ BankAccounts::SavingsAccount.new(0, 5) }.to raise_error(ArgumentError, "MINIMUM BALANCE $10 REQUIRED")
    end
  end

  context "When withdrawing money from bank account" do
    let(:savings) { BankAccounts::SavingsAccount.new(0, 500) }

    it "responds to withdraw(amount)" do
      expect(savings).to respond_to(:withdraw)
    end

    it "incurs a fee of $2 for each withdrawal - returning updated balance" do
      expect(savings.withdraw(50)).to eq(448)
      expect(savings.withdraw(436)).to eq(10)
    end

    it "raises an error when account is drawn below $10" do
      expect{ savings.withdraw(490) }.to raise_error(ArgumentError, "WARNING - You must have at least $10 in your savings account.\nYour current balance is $#{savings.balance}.")
    end
  end

  context "When adding interest to the account balance" do
    let(:savings) { BankAccounts::SavingsAccount.new(0, 10000) }

    it "calculates/returns the interest and adds the interest the to balance" do
      expect(savings.interest(0.25)).to eq(25)
      expect(savings.balance).to eq(10025)
    end
  end

end # describe
