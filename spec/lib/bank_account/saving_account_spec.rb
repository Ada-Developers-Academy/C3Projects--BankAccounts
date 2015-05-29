require "spec_helper"
require "./lib/bank_account/saving_account"
require "pry"


describe BankAccount::SavingAccount do

  context "#self.new" do
    it "responds to class method called new" do
      expect(BankAccount::SavingAccount).to respond_to :new
    end

    # Account cannot be created with less tha $10

  end # .new

    before :each do
      @account = BankAccount::SavingAccount.new(20, 100)
    end

  context "#withdraw" do
    it "withdraws $10 + 2 transaction fee" do
      expect(@account.withdraw(10)).to eq(88)
    end

  end

  context "#add_interest(rate)" do
    it "Calculates interest rate" do
      expect(@account.add_interest(0.25)).to eq(0.25)
    end

    it "Adds interest to the balance" do


    end

  end


end
