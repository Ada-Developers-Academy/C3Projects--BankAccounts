require 'spec_helper'
require 'pry'

describe BankAccounts::Account do

  it "responds to #new" do
    expect(BankAccounts::Account).to respond_to(:new)
  end

  it "responds to #new with two arguments" do
    expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
  end

  let(:bob) { BankAccounts::Account.new(1, 1000) }

  it "contains @id" do
    expect(bob.id).to eq(1)
  end

  it "contains @balance" do
    expect(bob.balance).to eq(1000)
  end

  it "cannot initialize with a negative initial_balance" do
    expect{BankAccounts::Account.new(2, -1000)}.to raise_error(ArgumentError)
  end   # Why does raise_error use expect{} vs expect()???

  it "responds to #withdraw" do
    expect(bob).to respond_to(:withdraw)
  end

  it "#withdraw subtracts & returns 'amount' from the balance" do
    expect(bob.withdraw(100)).to eq(900)
  end

end
