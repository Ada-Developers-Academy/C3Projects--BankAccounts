# require "account"

module BankAccount

	class SavingsAccount < Account
		# inherits all methods that Account has

		attr_accessor :id, :initial_balance, :account_balance

		def initialize(id, initial_balance)
			raise ArgumentError.new "Please enter a positive initial balance." unless initial_balance >= 10
			super
		end

		# has updated rules for withdraw method
			# cannot withdraw money if it will make your
			# account balance < 10
			# if you try, it will raise ArgumentError
			# will return original account balance

		def withdraw(amount)
			super

			if @account_balance < 10
				@account_balance += amount
				raise ArgumentError.new "Insufficient funds to make this withdraw including a $2 transaction fee. Your current balance is #{@account_balance}."
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
