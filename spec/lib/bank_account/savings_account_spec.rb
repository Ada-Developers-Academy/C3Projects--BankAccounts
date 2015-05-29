require 'spec_helper'

describe BankAccount::SavingsAccount do
  it "responds to the .new class method" do
    expect(BankAccount::SavingsAccount).to respond_to :new
  end
end
