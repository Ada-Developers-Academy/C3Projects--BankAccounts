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
      expect{tom.withdraw(1100)}.to output("Cannot withdraw amount; not enough money in account.\n").to_stdout
    end   # NOTE TO SELF: Remember the 'expect' before 'output' & 'raise_error' needs to be in a block.

    it "returns the original un-modified balance" do
      expect(tom.withdraw(1100)).to eq(1000)
    end

  end

  context "#withdraw_using_check subtracts 'amount' from balance (as a result of a check withdraw):" do
    results = [900, 800, 700]
    account = BankAccounts::CheckingAccount.new(2, 1000)
    results.each do |result|
      it "up to 3 (free) times" do
        expect(account.withdraw_using_check(100)).to eq(result)
      end
    end

    it "charges $2 after 3 free times" do
      expect(account.withdraw_using_check(100)).to eq(600)
    end
  end

  context "#withdraw_using_check allows account to go into overdraft:" do

    it "up to -$10 (returns modified balance)" do
      expect(tom.withdraw_using_check(1010)).to eq(-10)
    end

    it "but not any lower (returns un-modified balance)" do
      expect(tom.withdraw_using_check(1011)).to eq(1000)
    end

  end

  # Is it usual to copy and paste rspecs from a parent class?

end
