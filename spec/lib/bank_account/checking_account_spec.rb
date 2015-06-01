require 'spec_helper.rb'
require './lib/bank_account/checking_account'
require 'pry'

describe BankAccount::CheckingAccount do

  context "When you create a checking account" do

    let (:mediocre_checking_account) {BankAccount::CheckingAccount.new(1,100)}

    it "inherits Account constructor and has an initial balance of 100" do
      expect(mediocre_checking_account.initial_balance).to eq(100)
    end

  end
end
