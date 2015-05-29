require 'spec_helper'

describe BankAccounts::CheckingAccount do

  it "responds to #new" do
    expect(BankAccounts::CheckingAccount).to respond_to :new
  end

  before :each do
    @checking_account = BankAccounts::CheckingAccount.new("Name", 100)
  end

  it "responds to #id" do
    expect(@checking_account.id).to eq("Name")
  end

  it "returns 79 when 20 is withdrawn" do
    expect(@checking_account.withdraw(20)).to eq(79)
  end

  it "returns unmodified balance of 100 when 110 is requested to be withdrawn" do
    expect(@checking_account.withdraw(110)).to eq(100)
  end

  it "returns 80 when withdrawing 20 by check" do
    expect(@checking_account.withdraw_using_check(20)).to eq(80)
  end

  it "returns unmodified balance of 100 when 115 is requested to be withdrawn by check" do
    expect(@checking_account.withdraw_using_check(115)).to eq(100)
  end

  it "returns -5 when when withdrawing 105 by check" do
    expect(@checking_account.withdraw_using_check(105)).to eq(-5)
  end

  #The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
  it "returns 58 after 4 10 dollar withdrawals by check" do
    3.times do @checking_account.withdraw_using_check(10)
    expect(@checking_account.withdraw_using_check(10)).to eq(58)
    end
  end
end
