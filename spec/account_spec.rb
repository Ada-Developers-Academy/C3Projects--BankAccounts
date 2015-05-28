require 'spec_helper'
require 'bankaccounts'

describe BankAccount::Account do

  describe "It is initialized with assignments" do
  let (:bankaccount) {BankAccount::Account.new(1, 10_000)}

    it "has an ID of 1" do
      expect(bankaccount.id).to eq(1)
    end

    it "has an initial balance of 10_000" do
      expect(bankaccount.initial_balance).to eq(10000)
    end

    it "cannot have a negative account value initialized" do
      expect{BankAccount::Account.new(3, -5000)}.to raise_error(ArgumentError)
  end

  describe "It has instance methods" do
  let (:bankaccount) {BankAccount::Account.new(2, 100_000)}

    it "Has a withdraw method" do
      expect(bankaccount).to respond_to :withdraw
    end

  end



    # describe "attributes" do
    # let(:sale) { FarMar::Sale.find(1) }
    # # 1,People's Co-op Farmers FarMar::Sale,30,Portland,Multnomah,Oregon,97202
    #
    # it "has the id 1" do
    #   expect(sale.id).to eq 1
    # end
    #
    # it "has the amount in cents 9290" do
    #   expect(sale.amount).to eq 9290
    # end


  end
end
