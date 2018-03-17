class User
  attr_accessor :first_name, :second_name, :email

  def initialize(attributes = {})
    @first_name  = attributes[:first_name]
    @second_name  = attributes[:second_name]
    @email = attributes[:email]
  end

  def full_name
    "#{@first_name} #{@second_name}>"
  end
end