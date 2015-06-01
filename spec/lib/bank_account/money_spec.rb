require 'bank_account'

describe Bank::MoneyMarketAccount do
  context "attributes" do
    let(:market) {Bank::MoneyMarketAccount.new("momoney", 30000)}

    it "responds to :id" do
      expect(market).to respond_to :id
    end

    it "resonds to :balance" do
      expect(market).to respond_to :balance
    end

    it "has an initial balance of 30000" do
      expect(market.balance).to eq(30000)
    end

    context "low balance errors" do
      it "raises 'Insufficient Funds' for negative intial balance" do
        expect{Bank::MoneyMarketAccount.new("ballin", -10)}.to raise_error(ArgumentError)
      end

      it "returns 'ACCOUNT FROZEN' for balance below 10000" do
        expect(market.withdraw(25000)).to eq("ACCOUNT FROZEN: Must make a deposit.")
        expect(market.balance).to eq(4900)
      end

    end
  end
end
