class User

  attr_accessor :user_id, :user_type

  #below constants refers user types.
	EMPLOYEE = "E"
	AFFILIATE = "A"
  TWO_YEAR_OLD_CUSTOMER = "C"
  NORMAL_USER = 'N'

  def initialize(attrs={})
    @user_id = attrs[:user_id]
    @user_type = attrs[:user_type]
  end


  #by default user type will be normal.
  def user_type
    @user_type || NORMAL_USER
  end

  


end