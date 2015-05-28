require 'spec_helper'
require 'bank_accounts'

describe "BankAccounts::Account" do
  context "self.new" do
    it "responds to Account class" do
      expect(BankAccounts::Account).to respond_to(:new).with(2).arguments
    end
  end
end
