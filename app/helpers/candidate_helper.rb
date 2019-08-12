class CandidateHelper

  def create_new_candidates
    last_row = @@file_tool.read_data_from_file(ROW_FILE_URL, 2).to_i
    new_candidates = @@google_service.get_lines_from_sheet(last_row)
    new_candidates.each do |candidate|
      #create new candidate
    end
  end

  ROW_FILE_URL = "tmp/storage/last_row.txt"

  @@google_service = GoogleSheetsService.new
  @@talkpush_service = TalkpushService.new
  @@file_tool = FileTool.new
  
end
