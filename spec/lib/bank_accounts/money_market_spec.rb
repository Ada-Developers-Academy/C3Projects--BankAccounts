require 'spec_helper'
require 'bank_accounts'

describe BankAccounts::MoneyMarketAccount do

 context "A money market account is a bank account" do
   it "MoneyMarket class inherits from Account class" do
     expect(BankAccounts::MoneyMarketAccount.superclass).to eq(BankAccounts::Account)
   end
 end

end # describe