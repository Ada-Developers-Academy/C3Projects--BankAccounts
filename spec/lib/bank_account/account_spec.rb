require 'bank_account'

describe Bank::Account do

  describe "attributes" do
    context "negative balance errors" do
      it "raises 'Invalid initial balance' for negative initial balance" do
        expect{Bank::Account.new("no_go", -10)}.to raise_error(ArgumentError)
      end

    end

    let(:account) {Bank::Account.new("checkit", 1000)}

    it "has an initial balance of 1000" do
      expect(account.initial_balance).to eq(1000)
    end

    it "responds to :balance" do
      expect(account).to respond_to :initial_balance
    end

  end

end
