module BankAccounts

	class MoneyMarketAccount < Account

		attr_reader	:transactions_remaining

		def initialize(id, initial_balance)
			super
			@minimum 				= 10_000
			self.balance 			= initial_balance
			@transactions_remaining	= 6
			@withdrawal_allowed		= true
		end

		def validate_withdrawal(amount)
			valid = true
			if @withdrawal_allowed
				if @balance - amount < 10_000
					puts "You cannot make anymore withdrawals until your balance is $10k."
					amount_to_withdraw = amount + 100
					@withdrawal_allowed = false
					return amount, valid
				else
					return amount, valid
				end
			else
				puts "You cannot withdraw until your balance is $10k."
				valid = false
				return amount, false
			end
		end

		def withdraw(amount)
			super
			@transactions_remaining -= 1
		end

		def deposit(amount)
			starting_balance = @balance
			super
			ending_balance = @balance
			@transactions_remaining -= 1 unless starting_balance < 10_000 && ending_balance > 10_000
			return @balance
		end

	end
end