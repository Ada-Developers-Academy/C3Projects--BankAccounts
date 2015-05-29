module BankAccount

	class CheckingAccount < Account

		attr_reader :id, :initial_balance, :account_balance

		def initialize(id, initial_balance)
			raise ArgumentError.new "Please enter a positive initial balance." unless initial_balance > 0
			super

			@free_checks = 3
		end

		def withdraw(amount)
			fee = 1

			@account_balance = @account_balance - amount - fee

			if @account_balance < 0
				@account_balance = @account_balance + amount + fee
				raise ArgumentError.new "Insufficient funds to make this withdrawl including a $1 transaction fee. Your current balance is $#{@account_balance}."
				return @account_balance
			else 
				return @account_balance
			end
		end

		# withdraw_using_check(amount)
			# reduces account_balance by the amount
			# reduces free_checks by 1
			# returns the account_balance

			# account_balance must be >= -10

			# if free_checks > 0, no fee
			# if free_checks <= 0, 2 fee per transaction

		# reset_checks
			# resets free_checks to 3


		def deposit(amount)
			super
		end

		def balance
			super
		end


	end
end
