require "spec_helper"
require "./lib/bank_account/account"

describe BankAccount::Account do

  context "#self.new" do
    it "responds to class method called new" do
      expect(BankAccount::Account).to respond_to :new
    end
    #
    # it '#self.new cannot be created with negative balance'
    # @neg_account = account.new(20, -10)
    #   expect(BankAccount::Account.new(@neg_account)).to
    #
    # end
  end # context
    before :each do
      @account = BankAccount::Account.new(20, 100)
    end

    context "#withdraw(amount)" do
      it "10 dollars gets taken out of account, shows account balance of 90" do
        expect(@account.withdraw(10)).to eq(90)
      end

      it "$5.50 gets taken out of account, shows account balance of $94.50" do
        expect(@account.withdraw(5.50)).to eq(94.50)
      end
      
      # it "can't allow $100 balance to become negative by withdrawing $150" do
      #   expect(@account.withdraw(150)).to raise_exception
      # end


    end # withdraw context

    context "#deposit(amount)" do
      it "adds 20 dollars to account for balance of 120" do
        expect(@account.deposit(20)).to eq(120)
      end
    end # deposit

    context "#balance" do
      it "returs current account balance of 100" do
        expect(@account.balance).to eq(100)
      end
    end


end # describe
