require 'spec_helper.rb'
require './lib/bank_account/checking_account'
require 'pry'

describe BankAccount::CheckingAccount do

  context "When you create a checking account" do

    let (:sad_checking_account) {BankAccount::CheckingAccount.new(1,-1)}

    it "inherits Account constructor and throws error account has negative balance" do
      expect{sad_checking_account}.to raise_error(ArgumentError)
    end

  end

  context "Checking account transactions" do

    let (:mediocre_checking_account) {BankAccount::CheckingAccount.new(1,200)}

    it "withdraws funds, subtracts $1 fee, returns updated balance" do
      expect(mediocre_checking_account.withdraw(55)).to eq(144)
    end

    it "won't let you overdraft" do
      expect(mediocre_checking_account.withdraw(201)).to eq("Sorry, you can't have a negative balance in your account! Withdraw canceled. Let's keep your current balance at 200.")
    end

  end

end
