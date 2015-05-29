require 'bank_account'

describe Bank::CheckingAccount do
  context "attributes" do
    let(:checkings) {Bank::CheckingAccount.new("checkit", 100)}

    it "responds to :id" do
      expect(checkings).to respond_to :id
    end

    it "resonds to :balance" do
      expect(checkings).to respond_to :balance
    end

    it "has an initial balance of 100" do
      expect(checkings.balance).to eq(100)
    end

    it "returns 49 for ATM withdrawal of 50" do
      expect(checkings.withdraw(50)).to eq(49)
    end

    it "returns 75 for check withdrawal of 25" do
      expect(checkings.withdraw_using_check(25)).to eq(75)
      expect(checkings.checks_used).to eq(1)
    end

    context "low balance errors" do
      it "raises 'Insufficient Funds' for negative intial balance" do
        expect{Bank::CheckingAccount.new("broke_joke", -10)}.to raise_error(ArgumentError)
      end

      it "returns balance of 100 for ATM overdraft of 1000" do
        expect(checkings.withdraw(1000)).to eq(100)
      end

      it "returns balance of 100 for check withdrawal of 500" do
        expect(checkings.withdraw_using_check(500)).to eq(100)
      end
    end
  end
end
