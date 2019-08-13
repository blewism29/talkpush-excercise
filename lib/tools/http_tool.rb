class HttpTool
  
  include HTTParty

  def self.get (p_url)
    HTTParty.get(p_url)
  end

  def self.post (p_url, p_body, p_headers)
    HTTParty.post(p_url, :body => p_body.to_json, :headers => p_headers ).parsed_response
  end

end
