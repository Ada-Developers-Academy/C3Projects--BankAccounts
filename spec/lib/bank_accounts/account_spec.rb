require 'spec_helper'

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

  it "contains @initial_balance" do
    expect(bob.initial_balance).to eq(1000)
  end

end
