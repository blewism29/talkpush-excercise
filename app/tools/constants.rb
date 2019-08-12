class Constants

  attr_reader :GOOGLE_SHEETS_API_KEY
  attr_reader :GOOGLE_SHEET_ID

  private def initialize
    @GOOGLE_SHEETS_API_KEY = Rails.application.config.GOOGLE_SHEETS_API_KEY;
    @GOOGLE_SHEET_ID = Rails.application.config.GOOGLE_SHEET_ID
  end

  def self.get_instance
    @@instance.nil? ? Constants.new : @@instance
  end
  
  @@instance = nil
  
  
end
