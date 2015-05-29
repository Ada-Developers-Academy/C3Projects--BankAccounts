require "spec_helper"
require "bankaccount"

describe BankAccount::CheckingAccount do

	it "responds to the method new" do
		expect(BankAccount::CheckingAccount).to respond_to :new
	end

	it "is a subclass of Account" do
		expect(BankAccount::CheckingAccount.ancestors).to include(BankAccount::Account)
	end


	describe "it creates an instance of a new CheckingAccount with an id 1 and a positive initial_balance 500" do
		let(:checking_account) { BankAccount::CheckingAccount.new(1, 5000) }

		it "has the id 1" do
			expect(checking_account.id).to eq 1
		end

		it "has an initial_balance of 5000" do
			expect(checking_account.initial_balance).to eq 5000
		end

		it "raises an error if a negative initial_balance is entered" do
			expect{BankAccount::CheckingAccount.new(4, -400)}.to raise_exception(ArgumentError)
		end

		context "you can deposit money in your CheckingAccount" do
			it "returns 5500 if you deposit 500" do
				expect(checking_account.deposit(500)).to eq 5500
			end
		end

		context "you can check your account balance" do
			it "returns 3506 if you withdraw 500, deposit 10, and withdraw 1000." do
				checking_account.withdraw(500)
				checking_account.deposit(10)
				checking_account.withdraw(1000)
				expect(checking_account.balance).to eq 3508
			end
		end

		describe "#withdraw method" do
			context "you can withdraw money from your CheckingAccount for a 1 transaction fee, unless it would make your account balance go below 0" do
				it "returns 4499 if you withdraw 500 and it has a 1 transaction fee" do
					expect(checking_account.withdraw(500)).to eq 4499
				end
				it "raises an ArgumentError if you try to withdraw 6000" do
					expect{ checking_account.withdraw(6000) }.to raise_exception(ArgumentError)
				end
			end
		end

		describe "#withdraw_using_check method" do
			context "you can withdraw money until the account balance is < -10" do
				it "returns -5 when you withdraw 5005" do
					expect(checking_account.withdraw_using_check(5005)).to eq -5
				end
				it "returns an ArgumentError if you withdraw 5011" do
					expect{ checking_account.withdraw_using_check(5011) }.to raise_exception(ArgumentError)
				end
			end

			context "you get 3 free checks to withdraw from your account for free. After that, there is a 2 fee per withdrawl." do
				it "has 3 free checks when you create your CheckingAccount" do
					expect(checking_account.free_checks).to eq 3
				end

				it "reduces the free_checks count to 2 when you make your first withdrawl" do
					checking_account.withdraw_using_check(200) # account_balance == 4800; free_checks == 2
					expect(checking_account.free_checks).to eq 2
				end
				

				it "returns 4000 when you withdraw 1000 and have at least 1 free check" do
					checking_account.withdraw_using_check(1000)
					expect(checking_account.account_balance).to eq 4000
				end

				it "returns 4958 when you withdraw 10 four times--i.e. one transactions without a free check available" do
					4.times do 
						checking_account.withdraw_using_check(10)
					end
					expect(checking_account.account_balance).to eq 4958
				end
			end
		end # withdraw with check

		describe "you can reset your number of free_checks" do
			it "resets @free_checks to 3" do
				expect(checking_account.reset_checks).to eq 3
			end

			it "returns 2 free checks after this block" do
				2.times do
					checking_account.withdraw_using_check(100)
				end
				checking_account.reset_checks
				checking_account.withdraw_using_check(100)

				expect(checking_account.free_checks).to eq 2
			end
		end

	end # instance

end

