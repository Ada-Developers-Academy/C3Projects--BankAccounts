module Bank
  class CheckingAccount < Account

    def withdraw(amount)
      super
      # there was not an error with the withdrawal amount
      if !@is_error
        # subtract the $1 fee from balance
        return @balance - 1
      else
        # return the unmodified balance
        return @balance
      end
    end
  end
end
