require 'spec_helper.rb'


describe BankAccount::SavingsAccount do

  context "#init" do

    it "knows about SavingsAccount class" do
      expect(BankAccount::SavingsAccount).to respond_to :new
    end

    it "doesn't initialize a savings account with < $10" do
      expect{(BankAccount::SavingsAccount.new(3, 5))}.to raise_exception(ArgumentError)
    end
  

  end

end