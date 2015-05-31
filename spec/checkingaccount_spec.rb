require 'bankaccounts'
require 'pry'
require 'spec_helper'

describe BankAccount::CheckingAccount do

  describe "It has instance methods with functionality" do
    let (:bankaccount) {BankAccount::CheckingAccount.new(5, 500)}

    it "Withdrawing money incurs a $1 fee" do
      expect(bankaccount.withdraw(149)).to eq(350)
    end

    it "Returns a warning and original balance if withdrawal is greater than balance amount" do
      expect(bankaccount.withdraw(5000)).to eq(500)
    end

    it "withdraws using a check" do
      expect(bankaccount.withdraw_using_check(100)).to eq(400)
    end

    it "will allow an overdraft of up to $10" do
      expect(bankaccount.withdraw_using_check(505)).to eq(-5)
    end

    it "will return a warning and original balance if withdrawal is more than $10 over" do
      expect(bankaccount.withdraw_using_check(511)).to eq(500)
    end

    it "will add a $2 transaction fee after 3 free checks" do
      # loop allows the check count to get to 4
      4.times do
      bankaccount.withdraw_using_check(50)
      end
      expect(bankaccount.current_balance).to eq(298)
      expect(bankaccount.checks).to eq(4)
    end

    it "will reset the checks count to zero" do
      # loop ensures @checks was not already 0
      3.times do
        bankaccount.withdraw_using_check(50)
        end
      expect(bankaccount.reset_checks).to eq(0)
    end
  end
end
