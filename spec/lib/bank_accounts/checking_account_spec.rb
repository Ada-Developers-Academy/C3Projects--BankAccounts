require 'spec_helper'

describe BankAccounts::CheckingAccount do

  let(:tom) { BankAccounts::CheckingAccount.new(1, 1000) }

  it "#withdraw subtracts 'amount' from balance (and a $1 fee)" do
    tom.withdraw(100)
    expect(tom.balance).to eq(899)
  end

  it "#withdraw returns the updated balance" do
    expect(tom.withdraw(100)).to eq(899)
  end

  context "#withdraw does not allow account to go to negative:" do

    it "outputs a warning message" do
      expect(tom.withdraw(1100)).to output("Cannot withdraw amount; not enough money in account.\n").to_stdout
    end

    it "returns the original un-modified balance" do
      expect(tom.withdraw(1100)).to eq(1000)
    end

  end

  # Is it usual to copy and paste rspecs from a parent class?

end
