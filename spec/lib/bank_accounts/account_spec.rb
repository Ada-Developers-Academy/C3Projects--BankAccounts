require "spec_helper"
require "bank_accounts"

describe BankAccounts::Account do
  it "responds to class method called new" do
    expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
  end

  # it "is initialized with an id and initial balance"  do
  #   expect(BankAccounts::Account.new(4, 100)).to eq
  # end




end #describe
