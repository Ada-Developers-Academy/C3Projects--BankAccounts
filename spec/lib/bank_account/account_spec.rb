require "spec_helper"
require "./lib/bank_account/account"

describe BankAccount::Account do

  context "#self.new" do
    it "responds to class method called new" do
      expect(BankAccount::Account).to respond_to :new
    end

    let (:neg_account) {BankAccount::Account.new(20, -100)}

    it '#self.new with a negative balance raises an ArgumentError' do
      expect{neg_account}.to raise_error(ArgumentError, "Invalid amount.")
    end
  end # context

  let(:account) {BankAccount::Account.new(20, 100)}

  context "#withdraw(amount)" do
  [
    [10, 90],
    [5.50, 94.50],
    [150, 100]
  ].each do |withdraw, balance|
      it "#{withdraw} dollars gets taken out of account, show a balance of #{balance}." do
        expect(account.withdraw(withdraw)).to eq(balance)
      end
    end
  end # withdraw context

  context "#deposit(amount)" do
    it "adds 20 dollars to account for balance of 120" do
      expect(account.deposit(20)).to eq(120)
    end
  end # deposit

  context "#balance" do
    it "returs current account balance of 100" do
      expect(account.balance).to eq(100)
    end
  end

end # describe
