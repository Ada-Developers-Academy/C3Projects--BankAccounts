require './spec/spec_helper'
require './lib/bank_accounts/account'

describe BankAccounts::Account do

  describe "class methods" do
    it "responds to 'all'" do
      expect(BankAccounts::Account).to respond_to :new
    end
  end

end
