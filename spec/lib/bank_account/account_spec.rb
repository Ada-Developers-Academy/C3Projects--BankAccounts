require 'spec_helper.rb'
require './lib/bank_account/account'
require 'pry'

describe BankAccount::Account do

  context "Testing out my new method" do
    # Thanks Chef!
    # This 'let' statement allows you to create a variable called 'new account'
    # that runs something. This variable only works for this one context.
    let (:new_account) {BankAccount::Account.new(1,200)}

    it "responds to class method called .new" do
      expect(BankAccount::Account).to respond_to :new
    end


    it "ensures that the id instance variable works" do
      expect(new_account.id).to eq(1)
    end

    it "ensures that the initial_balance instance variable works" do
      expect(new_account.initial_balance).to eq(200)
    end

  end



puts "blah"
end
