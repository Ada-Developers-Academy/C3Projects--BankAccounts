module BankAccounts

	class Account
		attr_reader :id, :balance

		def initialize(id, initial_balance)
			@id 					= id
			@minimum 				= 0
			@fee					= 0
			self.balance			= initial_balance
		end

		# validate initial_balance input
		def balance=(initial_balance)
			if initial_balance == nil || initial_balance < @minimum
				raise ArgumentError.new("Initial balance must be at least: #{@minimum}.")
			end
			@balance = initial_balance
		end

		# def zero_balance
		# 	return @balance if amount == 0
		# end

		def validate_withdrawal(amount)
			return @balance if amount == 0
			valid = true
			# zero_balance

			amount_to_withdraw = amount + @fee
			if amount_to_withdraw <= @balance - @minimum
				return amount_to_withdraw, valid
			else
				puts "You cannot withdraw more than the limit: #{@minimum}."
				valid = false
				return @balance, valid
			end
		end

		def withdraw(amount)
			amount_to_withdraw, valid = validate_withdrawal(amount)
			if valid
				@balance -= amount_to_withdraw
			end
		end

		def deposit(amount)
			@balance += amount
		end
	end
end
