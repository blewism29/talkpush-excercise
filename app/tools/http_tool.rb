class HttpTool
  
  include HTTParty

  def self.get (url)
    begin
      HTTParty.get(url)
    rescue Exception => exception
      logger.error exception.to_s
    end
  end

  @@logger = Rails.logger

end
