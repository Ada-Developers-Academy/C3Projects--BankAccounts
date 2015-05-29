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

  end
end
