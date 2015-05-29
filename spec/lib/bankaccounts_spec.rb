require 'spec_helper'

describe BankAccounts::Account do

  it "responds to #new" do
     expect(BankAccounts::Account).to respond_to :new
  end

  it "raises an ArgumentError if initial_balance is negative" do
    expect{ BankAccounts::Account.new("name", -3) }.to raise_error(ArgumentError, "Only positive balances allowed")
  end

  



end
