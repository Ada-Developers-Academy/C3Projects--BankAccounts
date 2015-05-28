require 'spec_helper'
require 'bank_accounts'

describe BankAccounts::Account do
  it "responds to class instantiation with 2 arguments" do
    expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
  end

end # describe