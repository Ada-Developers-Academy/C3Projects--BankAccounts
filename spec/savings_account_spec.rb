require 'spec_helper'
require './lib/bank_accounts/savings_account'

describe BankAccounts::SavingsAccount do

	let(:savings_account) { BankAccounts::SavingsAccount.new(id_option, balance_option) }
	let(:default_id)					{ 2 }
	let(:default_balance)				{ 200 }

	it "responds to class .new method" do
		expect(BankAccounts::SavingsAccount).to respond_to :new
	end


	context "With any SavingsAccount it..." do
		let(:id_option)			{ default_id }
		let(:balance_option)	{ default_balance }

		it "new savings_account has id" do
			expect(savings_account.id).to eq(2)
		end

		it "new savings_account has balance" do
			expect(savings_account.balance).to eq(200)
		end

		it "responds to #withdraw" do
			expect(savings_account).to respond_to :withdraw
		end

		context "withdraws an amount" do

			it "lowers balance by amount withdrawn plus 2" do
				savings_account.withdraw(10)
				expect(savings_account.balance).to eq(188)
			end

			it "puts error message if amount withdrawn is greater than minimum balance" do
				savings_account.withdraw(200)
				expect(savings_account.balance).to eq(200)
			end
		end

		context "adds interest" do

			it "adds interest to account and returns interest" do
				expect(savings_account.add_interest(1)).to eq(2)
			end
		
			it "new balance equals old balance plus interest" do
				savings_account.add_interest(1)
				expect(savings_account.balance).to eq(202)
			end
		end
	end

	context "too small initial balance" do

		it "raises ArgumentError in case of initial balance under 10" do
			expect { 
				BankAccounts::SavingsAccount.new(3, 5)
			}.to raise_error ArgumentError
		end
	end

end
