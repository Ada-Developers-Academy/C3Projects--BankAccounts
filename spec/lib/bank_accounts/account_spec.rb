require "spec_helper"
require "bank_accounts"

describe BankAccounts::Account do
  it "responds to class method called new" do
    expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
  end

  it "returns the initial balance" do
    account = BankAccounts::Account.new(4, 100)
    expect(account.initial_balance).to eq(100)
  end

  it "raises an ArgumentError if negative number is passed for initial_balance" do
    expect { BankAccounts::Account.new(4, -500) }.to raise_exception(ArgumentError)
  end

end #describe
