require './spec/spec_helper'
require './lib/bank_accounts/account'

describe BankAccounts::Account do


  describe "class methods" do

    it "responds to 'new'" do
      expect(BankAccounts::Account).to respond_to :new
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

    it "withdraws money" do
      expect(account.withdraw(10)).to eq(0)
    end


  end # instance methods


end # Account class
