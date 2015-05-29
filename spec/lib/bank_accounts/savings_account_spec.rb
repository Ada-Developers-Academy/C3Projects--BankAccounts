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

end
