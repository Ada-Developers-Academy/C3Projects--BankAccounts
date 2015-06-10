module BankAccounts

	class CheckingAccount < BankAccounts::Account
		attr_reader :free_checks_remaining, :using_check

		FREE_CHECK_COUNT = 3

		def initialize(id, initial_balance)
			super
			@minimum 				= 0
			@overdraft_limit	 	= -10
			@fee					= 1
			@check_fee				= 2
			@free_checks_remaining 	= FREE_CHECK_COUNT
		end

		def validate_check_withdrawal(amount)
			return @balance if amount == 0
			valid = true
			amount_to_withdraw = @free_checks_remaining > 0 ? amount : amount + @check_fee
			if amount_to_withdraw <= @balance - @overdraft_limit
				return amount_to_withdraw, valid
			else
				puts "You cannot withdraw more than the limit: #{@overdraft_limit}."
				valid = false
				return @balance, valid
			end
		end

		def withdraw_using_check(amount)
			amount_to_withdraw, valid = validate_check_withdrawal(amount)

			if valid
				@balance -= amount_to_withdraw
			end

			@free_checks_remaining -= 1
		end

		def reset_checks
			@free_checks_remaining = FREE_CHECK_COUNT
		end
	end
end
