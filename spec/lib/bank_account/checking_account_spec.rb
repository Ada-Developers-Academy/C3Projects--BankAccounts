require 'spec_helper'

describe BankAccount::CheckingAccount do
  it "responds to the .new class method" do
    expect(BankAccount::CheckingAccount).to respond_to :new
  end
end

describe "Executing a withdraw" do
  let (:account) {BankAccount::CheckingAccount.new(345, 500,)}
  it "When withdraw is executed the balance of the bank account will be reduced by withdraw amount and then deduct an additional 1 and lastly will return the new balance" do
    expect(account.withdraw(50)).to eq(449)
  end
end

describe "Executing a withdraw with check" do
  let (:account) {BankAccount::CheckingAccount.new(345, 500,)}
  it "When withdraw with check is executed the balance of the bank account will be reduced by withdraw amount and will return the new balance" do
    expect(account.withdraw_using_check(50)).to eq([2,450])
  end
end

describe "Executing a withdraw with check past the free 3" do
  let (:account) do
    x= BankAccount::CheckingAccount.new(345, 500,)
    3.times {x.withdraw_using_check(5)}
    x
  end
  it "When withdraw with check is executed the balance of the bank account will be reduced by withdraw amount and an additional 2 and will return the new balance" do
    expect(account.withdraw_using_check(50)).to eq([-1,433])
  end
end

describe "Executing Resetting Checks Resets Checks to 3" do
  let (:account) {BankAccount::CheckingAccount.new(345, 500,)}
  it "When the reset checks is executed checks will reset to 3" do
    expect(account.reset_checks).to eq(3)
  end
end
# end
