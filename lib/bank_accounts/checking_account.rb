module BankAccounts

	class CheckingAccount < BankAccounts::Account
		attr_reader :free_checks_remaining, :using_check

		def initialize(id, initial_balance)
			super
			@minimum 				= 0
			@overdraft_limit	 	= -10
			@fee					= 1
			@check_fee				= 2
			@free_checks_remaining 	= 3
			@using_check 			= false
		end

		def validate_withdrawal(amount)
			if @using_check
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
			else
				super
			end
		end

		def withdraw_using_check(amount)
			@using_check = true
			amount_to_withdraw, valid = validate_withdrawal(amount)

			if valid
				@balance -= amount_to_withdraw
			end
			@free_checks_remaining -= 1

			# reset @using_check
			@using_check = false
		end

		def reset_checks
			@free_checks_remaining = 3
		end
	end
end
