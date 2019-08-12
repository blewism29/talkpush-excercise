class GoogleSheetsService

  def initialize  
    constants = Constants.get_instance
    @api_key = constants.GOOGLE_SHEETS_API_KEY
    @sheet_id = constants.GOOGLE_SHEET_ID
  end  

  def get_lines_from_sheet (p_offset)
    response = HttpTool.get("#{BASE_URL}#{@sheet_id}/values/A#{p_offset.to_s}:F#{(p_offset + 100).to_s}?key=#{@api_key}")
    parse_response(response)
  end

  private def parse_response (p_response)
    p_response.values[2].map {
      |candidate| Candidate.new( candidate[0], candidate[1], candidate[2], candidate[3], candidate[4] )
    }
  end 

  BASE_URL = "https://sheets.googleapis.com/v4/spreadsheets/"

end
