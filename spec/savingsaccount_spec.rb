require 'spec_helper'
require 'bankaccounts'

describe BankAccount::SavingsAccount do

  describe "It is initialized with assignments" do
  let (:bankaccount) {BankAccount::SavingsAccount.new(1, 10000)}

  it "has an ID of 1" do
    expect(bankaccount.id).to eq(1)
  end

  it "has an initial balance of 10000" do
    expect(bankaccount.initial_balance).to eq(10000)
  end

  end

end
