module BankAccounts

	class Account
		attr_reader :id, :initial_balance

		def initialize(id, initial_balance)
			@id 					= id
			self.initial_balance	= initial_balance
		end

		def initial_balance=(initial_balance)
			# unless initial_balance > 0
			if initial_balance == nil || initial_balance < 0
				raise ArgumentError.new("Initial balances cannot be nil or negative.")
			end
			@initial_balance = initial_balance
		end
	end
end
