require 'spec_helper'

describe BankAccounts::SavingsAccount do

  it "responds to #new" do
    expect(BankAccounts::SavingsAccount).to respond_to :new
  end

  it "raises an ArgumentError if initial_balance is less than 10" do
    expect{ BankAccounts::SavingsAccount.new("Name", 5) }.to raise_error(ArgumentError, "Initial balances must be at least 10")
  end

  before :each do
    @savings_account = BankAccounts::SavingsAccount.new("Name", 100)
  end

  it "rsponds to #id" do
    expect(@savings_account.id).to eq("Name")
  end

  it "returns 120 when 20 is deposited using Account #deposit" do
    expect(@savings_account.deposit(20)).to eq(120)
  end

  it "returns 78 when 20 is withdrawn" do
    expect(@savings_account.withdraw(20)).to eq(78)
  end

  it "returns unmodified balance of 100 when 95 is requested to be withdrawn" do
    expect(@savings_account.withdraw(95)).to eq(100)
  end



end
