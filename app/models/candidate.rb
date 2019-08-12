class Candidate

  attr_reader :timestamp
  attr_reader :name
  attr_reader :last_name
  attr_reader :email
  attr_reader :phone

  def initialize (p_timestamp, p_name, p_last_name, p_email, p_phone)
    @timestamp = p_timestamp
    @name = p_name
    @last_name = p_last_name
    @email = p_email
    @phone = p_phone
  end
  
end
