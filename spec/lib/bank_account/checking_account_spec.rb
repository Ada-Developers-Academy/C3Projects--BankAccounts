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

    # I couldn't figure out how to run the withdraw_using_check method on
    # the mediocre_checking_account three times in rspec to test the
    # check withdraw fee. So I manually reset the instance variable...
    let (:other_checking_account) {BankAccount::CheckingAccount.new(1,200)}
    let (:no_free_checks_account) {other_checking_account.free_checks = 0
    other_checking_account.withdraw_using_check(5)}

    it "withdraws funds, subtracts $1 fee, returns updated balance" do
      expect(mediocre_checking_account.withdraw(55)).to eq(144)
    end

    it "won't let you overdraft" do
      expect(mediocre_checking_account.withdraw(201)).to eq("Sorry, you can't have a negative balance in your account! Withdraw canceled. Let's keep your current balance at 200.")
    end

    it "lets you withdraw with a $210 check, overdrafting by $10" do
      expect(mediocre_checking_account.withdraw_using_check(210)).to eq(-10)
    end

    it "won't let you overdraft more than $10 when withdrawing a check" do
      expect(mediocre_checking_account.withdraw_using_check(211)).to eq("Sorry, you can't overdraft more than $10! Withdraw canceled. Let's keep your current balance at 200.")
    end

    it "tacks on a $2 withdraw fee when you're out of free checks" do
      expect(no_free_checks_account).to eq(193)
    end

    it "resets free checks to zero" do
      expect(mediocre_checking_account.reset_checks).to eq(0)
    end

  end

end
