class HttpTool
  
  include HTTParty

  def self.get (url)
    HTTParty.get(url)
  end

end
