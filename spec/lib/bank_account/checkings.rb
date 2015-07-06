require 'bank_account'

describe Bank::CheckingAccount do
  context "attributes" do
    let(:checkings) {Bank::CheckingAccount.new("keep_it", 100)}

    it "responds to :id" do
      expect(checkings).to respond_to :id
    end

    it "resonds to :balance" do
      expect(checkings).to respond_to :balance
    end

    it "has id 'keep_it'" do
      expect(checkings.id).to eq("keep_it")
    end

    it "has an initial balance of 100" do
      expect(checkings.balance).to eq(100)
    end

    it "returns 48 for a withdrawal of 50" do
      expect(checkings.withdraw(50)).to eq(48)
    end

    context "low balance errors" do
      it "raises 'Insufficient Funds' for balance < 10" do
        expect{Bank::CheckingAccount.new("so_broke", -10)}.to raise_error(ArgumentError)
      end

      it "returns original balance of 1000 for overdraft" do
        expect(checkings.withdraw(1000)).to eq(100)
      end
    end
  end
end
