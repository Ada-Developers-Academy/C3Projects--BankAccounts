module BankAccounts

	class SavingsAccount < BankAccounts::Account
		# def initialize(id, initial_balance)
		# 	super
		# end

		def initial_balance=(initial_balance)
			if initial_balance == nil || initial_balance < 10
				raise ArgumentError.new("Initial balance must be over 10.")
			end
			@balance = initial_balance
		end
	end
end
