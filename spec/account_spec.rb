require "spec_helper"
require "bankaccount"

describe BankAccount::Account do
	
	it "responds to class method called new" do
		expect(BankAccount::Account).to respond_to :new
	end

	describe "it creates an instance of a new Account with an id and a positive initial_balance" do
		let(:account) { BankAccount::Account.new(1, 500) }

		it "has the id 1" do
			expect(account.id).to eq 1
		end

		it "has an initial_balance of 500" do
			expect(account.initial_balance).to eq 500
		end

		it "raises an error if a negative initial_balance is entered" do
			expect{BankAccount::Account.new(4, -400)}.to raise_exception(ArgumentError)
		end
	end

	describe "an Account instance with an initial balance of 5000" do
		let(:account) { BankAccount::Account.new(1, 5000) }

		describe "you can withdraw money from your account" do
			it "responds to the method 'withdraw'" do
				expect(account).to respond_to :withdraw
			end

			context "reduces the account balance when the withdraw method is called" do
				it "returns 4000 when you withdraw 1000" do
					expect(account.withdraw(1000)).to eq 4000
				end

				it "returns 3500 when you withdraw 1000 and then withdraw 500" do
					account.withdraw(1000)
					expect(account.withdraw(500)).to eq 3500
				end
			end

			context "returns the unchanged account balance if you withdraw more money than you currently have" do
				it "returns 5000 if you try to withdraw 6000; And raises an ArgumentError" do
					expect(account.account_balance).to eq 5000
					expect{account.withdraw(6000)}.to raise_exception(ArgumentError)
				end
			end
		end # withdraw

		describe "you can deposit money into your account" do
			it "responds to the method 'deposit'" do
				expect(account).to respond_to :deposit
			end

			context "increases the current_balance when the deposit method is called" do
				it "returns 7000 when you deposit 2000" do
					expect(account.deposit(2000)).to eq 7000
				end

				it "returns 4620 when you withdraw 400 and then deposit 20" do
					account.withdraw(400)
					expect(account.deposit(20)).to eq 4620
				end
			end
		end # deposit

		describe "you can check your current account balance" do
			it "responds to the method 'balance'" do
				expect(account).to respond_to :balance
			end

			context "returns the current balance of your account" do
				it "returns the initial balance (5000) if you have not made any transactions" do
					expect(account.balance).to eq 5000
				end

				it "returns 4000 as current balance after you've withdrawn 1000" do
					account.withdraw(1000)
					expect(account.balance).to eq 4000
				end

				it "returns 2525 as current balance after you've -3000 +1000 -500 +25" do
					account.withdraw(3000)
					account.deposit(1000)
					account.withdraw(500)
					account.deposit(25)
					expect(account.balance).to eq 2525
				end
			end
		end # check balance




	end # Account instance


end # describe



