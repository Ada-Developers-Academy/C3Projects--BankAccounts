module BankAccount
	

	class Saving < Account

		def initialize(id, initial_balance)
			super	
			if @initial_balance < 10 
				raise ArgumentError, "an error has occurred. Balance must equal more than $10. Please make a deposit."
			end	
			@available_balance
		end #initialize end


		def withdraw(w_amount)  
			trans_fee = 2
			mandatory_balance = 10
			if @current_balance < 12
				raise ArgumentError, "I'm sorry, There are not enough funds to complete this transaction. Please try again and/or make a deposit. Thanks. \n $#{@current_balance} is currently avaialble."
			else  @current_balance >= 12
					@current_balance -= (w_amount + trans_fee)
					if @current_balance < 10
						@current_balance += (w_amount + trans_fee)
						raise ArgumentError,"This withdrawl would have overdrafted your account.\n Please recalculate and make another request.\n Perhaps a deposit? Current Balance: $#{@current_balance}."
					elsif @current_balance.between?(11,20)
						puts "COURTESY NOTICE: Please be aware, you currently have $#{@current_balance}. Perhaps a deposit?"	
					end
				puts "Your new balance is $#{@current_balance}."
				return @current_balance
			end	
		end #withdraw end

		def add_interest(rate)
			interest_gained = 0
			interest_gained = @current_balance * (rate/100)
			@current_balance += interest_gained
			return "Congrats, $#{interest_gained} has been added to your account."
		end #add_interest end
	
end #Class Saving end




end #module end