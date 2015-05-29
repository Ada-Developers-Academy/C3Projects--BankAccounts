require 'bank_account'

describe Bank::SavingsAccount do
  let(:savings) {Bank::SavingsAccount.new(id, balance)}

  it "responds to :id" do
    expect(savings).to respond_to :id
  end
end
