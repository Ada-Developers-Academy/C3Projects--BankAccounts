require "spec_helper"
require "bankaccount"

describe BankAccount::MoneyMarketAccount do

	it "responds to the method new" do
		expect(BankAccount::MoneyMarketAccount).to respond_to :new
	end

	it "is a subclass of Account" do
		expect(BankAccount::MoneyMarketAccount.ancestors).to include(BankAccount::Account)
	end

	it "raises an error if an initial_balance < 10,000 is entered" do
		expect{BankAccount::MoneyMarketAccount.new(4, 5000)}.to raise_exception(ArgumentError)
	end

	describe "an instance of a MoneyMarketAccount" do

		let(:money_market_account) { BankAccount::MoneyMarketAccount.new(1, 15_000) }

		it "reduces allowed_transactions to 5 when you make a withdrawal" do
			money_market_account.withdraw(100)
			expect(money_market_account.allowed_transactions).to eq 5
		end

		it "reduces allowed_transactions to 5 when you make a deposit" do
			money_market_account.deposit(100)
			expect(money_market_account.allowed_transactions).to eq 5
		end

		it "will not deposit additional money if you have no more allowed_transactions" do
			6.times do
				money_market_account.deposit(100)
			end
			expect(money_market_account.deposit(400)).to eq 15_600
		end

		# context "MoneyMarketAccounts get 'frozen' if their balance is < 10,000" do
		# 	it "will not allow you to withdraw money if @frozen_account == true" do
		# 		money_market_account.withdraw(10_000)
		# 		expect(money_market_account.withdraw(100)).to eq 5_000
		# 	end
		# end 

		it "resets allowed_transactions to 6 when you call the reset_transactions method" do
			2.times do
				money_market_account.deposit(100)
			end # allowed_transactions should now be at 4
			money_market_account.reset_transactions
			expect(money_market_account.allowed_transactions).to eq 6
		end


		describe "you can accrue interest on your account balance" do
			context "add_interest returns the amount of interest you have earned"do
				it "returns 37.50 when you call add_interest method at a 0.25 interest rate" do
					expect(money_market_account.add_interest(0.25)).to eq 37.50
				end
			end

			context "adds the interest that's calculated to the account balance" do
				it "returns 15,037.50 when you add interest at a 0.25 rate" do
					money_market_account.add_interest(0.25)
					expect(money_market_account.account_balance).to eq 15_037.50
				end

				context "it rounds interest and account_balance to two decimal places" do
					it "returns 15,050.81 when you add interest at a 0.338739340 rate" do
						money_market_account.add_interest(0.338739340)
						expect(money_market_account.account_balance).to eq 15_050.81
					end
				end
			end
		end

	end # instance



end #describe BankAccount::MoneyMarketAccount