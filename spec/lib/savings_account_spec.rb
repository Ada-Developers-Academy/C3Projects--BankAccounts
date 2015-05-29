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

  it "responds to #id" do
    expect(@savings_account.id).to eq("Name")
  end

  it "returns 120 when 20 is deposited" do
    expect(@savings_account.deposit(20)).to eq(120)
  end

  it "returns 78 when 20 is withdrawn" do
    expect(@savings_account.withdraw(20)).to eq(78)
  end

  it "returns unmodified balance of 100 when 95 is requested to be withdrawn" do
    expect(@savings_account.withdraw(95)).to eq(100)
  end

  it "returns 25 when #add_interest(0.25) is called" do
    expect(BankAccounts::SavingsAccount.new("Name", 10_000).add_interest(0.25)).to eq(25)
  end

  it "returns balance after adding interest" do
    my_savings = BankAccounts::SavingsAccount.new("Name", 10_000)
    my_savings.add_interest(0.25)
    expect(my_savings.balance).to eq(10_025)
  end
end
