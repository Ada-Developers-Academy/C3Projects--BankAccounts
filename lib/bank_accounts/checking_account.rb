module BankAccounts

	class CheckingAccount < BankAccounts::Account
		attr_reader :check_count, :using_check

		def initialize(id, initial_balance)
			super
			@minimum 				= 0
			@overdraft_limit	 	= -10
			@fee					= 1
			@check_fee				= 2
			@check_count 			= 0
			@using_check 			= false
		end 

		def validate_withdrawal(amount)
			if @using_check
				return @balance if amount == 0
				valid = true
				amount_to_withdraw = @check_count < 3 ? amount : amount + @check_fee
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
			@check_count += 1

			# reset @using_check
			@using_check = false
		end

		def reset_checks
			@check_count = 0
		end
	end
end
