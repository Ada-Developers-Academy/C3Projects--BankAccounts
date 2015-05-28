require 'spec_helper'
require 'bank_accounts'

describe BankAccounts::Account do
  it "responds to class instantiation" do
    expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
  end

end # describe