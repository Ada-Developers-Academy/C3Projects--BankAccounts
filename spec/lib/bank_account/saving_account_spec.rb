require "spec_helper"
require "./lib/bank_account/saving_account"

describe BankAccount::SavingAccount do

    it "Account class is the parent of SavingAccount" do
      expect(BankAccount::SavingAccount.superclass).to eq(BankAccount::Account)
    end

  context "#self.new" do
    it "responds to class method called new" do
      expect(BankAccount::SavingAccount).to respond_to :new
    end
  end # .new

  let(:account) {BankAccount::SavingAccount.new(20, 100)}

  context "#withdraw" do
    it "withdraws $10 + 2 transaction fee" do
      expect(account.withdraw(10)).to eq(88)
    end

    it "doesn't allow balance to go below $10" do
      expect(account.withdraw(95)).to eq(100)
    end
  end # withdraw

  context "#add_interest(rate)" do
    it "Returns the interest of $0.25" do
      expect(account.add_interest(0.25)).to eq(0.25)
    end

    it "Returns interest of $20" do
      @big_saver = BankAccount::SavingAccount.new(20, 100_000)
      expect(@big_saver.add_interest(0.20)).to eq(200)
    end
  end

end
