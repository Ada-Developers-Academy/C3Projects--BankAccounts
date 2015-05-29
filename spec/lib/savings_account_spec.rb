require 'spec_helper'

describe BankAccounts::SavingsAccount do

  it "responds to #new" do
    expect(BankAccounts::SavingsAccount).to respond_to :new
  end

  it "raises an ArgumentError if initial_balance is less than 10" do
    expect{ BankAccounts::Account.new("name", 5) }.to raise_error(ArgumentError, "Initial balances must be at least 10")
  end

  before :each do
    @savings_account = BankAccounts::SavingsAccount.new("Name", 100)
  end

  it "returns 120 when 20 is deposited using Account #deposit" do
    expect(@savings_account.deposit(20)).to eq(120)
  end


end
