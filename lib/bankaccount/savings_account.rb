# require "account"

module BankAccount

	class SavingsAccount < Account
		# inherits all methods that Account has

		attr_reader :id, :initial_balance, :account_balance

		def initialize(id, initial_balance)
			raise ArgumentError.new "Please enter a positive initial balance." unless initial_balance >= 10
			super
		end

		def withdraw(amount)
			fee = 2

			@account_balance = @account_balance - amount - fee

			if @account_balance < 10
				@account_balance = @account_balance + amount + fee
				raise ArgumentError.new "Insufficient funds to make this withdrawl including a $2 transaction fee. Your current balance is $#{@account_balance}."
				return @account_balance
			else 
				return @account_balance
			end
		end

		def deposit(amount)
			super
		end

		def balance
			super
		end

		# new add_interest instance method




	end

end
