module BankAccounts
  ##----------------------------------------------------------------------------
  # GEM DEPENDENCIES
  require "awesome_print"


  ##----------------------------------------------------------------------------
  # FILE DEPENDENCIES

  # breakfast
  require_relative "bank_accounts/account"
  require_relative "bank_accounts/savings_account"

  # lunch
  require_relative "bank_accounts/checking_account"

  # dinner
  require_relative "bank_accounts/money_market_account"


  ##----------------------------------------------------------------------------
  # UNNECESSARY FLAVOR TEXT (thanks Brenna for inspiration n_n)


  RECOMMEND_MONEY_MARKET = 12_000
  RECOMMEND_SISTER_BANK = 2_000_000

  OUR_BIRTH = "circa 1280 CE"
  OUR_FOUNDING_LOCATION = "Switzerland"
  OUR_NAME = "En Huffe Güld"
  OUR_NATIONALITY = "Swiss"
  OUR_NUMBER = "1-800-123-4567"

  SISTER_BIRTH = "circa 1450 BCE"
  SISTER_NAME = "Two Big to Fail & Son"
  SISTER_NATIONALITY = "Assyrian"
  SISTER_NUMBER = "1-800-TWO-N-SON (1-800-896-6766)"

  WELCOME_MESSAGE = "      =========================== #{ OUR_NAME } ===========================\nBean counters & banking specialists since our founding in #{ OUR_FOUNDING_LOCATION } #{ OUR_BIRTH }.\n   ============== Customer Satisfaction Hotline: #{ OUR_NUMBER }. =============="

  MONEY_MARKET_RECOMMENDATION = "With that level of funds, you should consider opening a Money Market account with us, too!\nOur Money Market accounts offer a higher rate of interest than our regular Savings and\nChecking accounts."

  SISTER_BANK_RECOMMENDATION = "We are unable to handle deposits of that size. May we suggest opening an account\nwith our #{ SISTER_NATIONALITY } sister bank, #{ SISTER_NAME }? To book an appointment with them, please\ncall #{ SISTER_NUMBER }."

  puts WELCOME_MESSAGE
end
