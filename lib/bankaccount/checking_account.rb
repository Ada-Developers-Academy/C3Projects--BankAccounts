module BankAccount

	class CheckingAccount < Account

		attr_reader :id, :initial_balance, :account_balance, :free_checks

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

		def withdraw_using_check(amount)
			fee = (@free_checks > 0) ? 0 : 2

			@account_balance = @account_balance - amount - fee

			if @account_balance < -10
				@account_balance = @account_balance + amount + fee
				raise ArgumentError.new "Insufficient funds to make this withdrawl. Your current balance is $#{@account_balance}."
				return @account_balance
			else 
				@free_checks -= 1
				return @account_balance
			end
		end

		def reset_checks
			@free_checks = 3
			return @free_checks
		end


		def deposit(amount)
			super
		end

		def balance
			super
		end


	end
end
