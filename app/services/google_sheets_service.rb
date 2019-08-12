class GoogleSheetsService

  def initialize  
    constants = Constants.get_instance
    @api_key = constants.GOOGLE_SHEETS_API_KEY
    @sheet_id = constants.GOOGLE_SHEET_ID
  end  

  def get_lines_from_sheet (p_offset)
    response = HttpTool.get("https://sheets.googleapis.com/v4/spreadsheets/#{@sheet_id}/values/A#{p_offset}:F#{p_offset + 100}'}?key=#{@api_key}")
  end

  private def parse_response (p_response)
    p_response.values[2]
  end 

end
