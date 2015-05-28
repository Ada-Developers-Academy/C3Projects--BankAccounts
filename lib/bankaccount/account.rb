module BankAccount

	class Account

		attr_accessor :id, :initial_balance

		def initialize(id, initial_balance)
			raise ArgumentError.new "Please enter a positive initial balance." unless initial_balance >= 0
				@id = id
				@initial_balance = initial_balance
		end



	end

end