require './lib/bank_account/savings_account.rb'

describe Bank::SavingsAccount do
  context "attributes" do
    let(:savings) {Bank::SavingsAccount.new("keep_it", 100)}

    it "responds to :id" do
      expect(savings).to respond_to :id
    end

    it "resonds to :balance" do
      expect(savings).to respond_to :balance
    end

    it "has id 'keep_it'" do
      expect(savings.id).to eq("keep_it")
    end

    it "has an initial balance of 100" do
      expect(savings.balance).to eq(100)
    end

    it "returns 48 for a withdrawal of 50" do
      expect(savings.withdraw(50)).to eq(48)
    end

    context "accruing interest" do
      let(:more_savings) {savings.add_interest(10)}

      it "returns 10 for an interest rate of 10%" do
        expect(savings.add_interest(10)).to eq(10)
        expect(savings.balance).to eq(110)
      end

    end

    context "low balance errors" do
      it "raises 'Insufficient Funds' for balance < 10" do
        expect{Bank::SavingsAccount.new("so_broke", -10)}.to raise_error(ArgumentError)
      end

      it "returns original balance of 100 for overdraft" do
        expect(savings.withdraw(1000)).to eq(100)
      end
    end
  end
end
