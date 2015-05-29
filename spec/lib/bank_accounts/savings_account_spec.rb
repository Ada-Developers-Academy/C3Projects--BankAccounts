require 'spec_helper'

describe BankAccounts::SavingsAccount do

  it "responds to #new with two arguments" do
    expect(BankAccounts::SavingsAccount).to respond_to(:new).with(2).arguments
  end

  let(:george) { BankAccounts::SavingsAccount.new(1, 1000) }

  it "contains @id" do
    expect(george.id).to eq(1)
  end

  it "contains @balance" do
    expect(george.balance).to eq(1000)
  end

  it "cannot initialize with a negative initial_balance" do
    expect{BankAccounts::SavingsAccount.new(2, -100)}.to raise_error(ArgumentError)
  end

  it "cannot initialize with a initial balance below 10" do
    expect{BankAccounts::SavingsAccount.new(3, 9)}.to raise_error(ArgumentError)
  end

  it "can initialize with an initial balance of 10" do
    expect{BankAccounts::SavingsAccount.new(4, 10)}.not_to raise_error
  end

  it "responds to #withdraw" do
    expect(george).to respond_to(:withdraw)
  end

  it "#withdraw subtracts 'amount' from the balance (& a $2 fee) & returns balance" do
    expect(george.withdraw(100)).to eq(898)
  end

  context "#withdraw cannot subtract more than minimum balance:" do

    it "outputs a warning message" do
      expect{george.withdraw(1100)}.to output("Cannot withdraw amount; not enough money in account.\n").to_stdout
    end   # NOTE TO SELF: output().to_stdout checks the method bob.error is printing the string

    it "& returns original balance" do
      expect(george.withdraw(1100)).to eq(1000)
    end   # 1000 is original balance

    it "responds to #add_interest" do
      expect(george).to respond_to(:add_interest)
    end

    it "#add_interest calculates & returns interest" do
      expect(george.add_interest(0.25)).to eq(250)
    end

    it "#add_interest adds interest to balance (balance check)" do
      account = george.add_interest(0.25)
      expect(account.balance).to eq(1250)
    end

  end #context

end
