class TalkpushService

  def initialize  
    constants = Constants.get_instance
    @api_key = constants.TALKPUSH_API_KEY
    @campaign_id = constants.TALKPUSH_CAMPAIGNID
  end

  def create_new_candidate (p_candidate)
    body = {
      api_key: @api_key,
      campaign_invitation: {
        first_name: p_candidate.name,
        last_name: p_candidate.last_name,
        email: p_candidate.email,
        user_phone_number: p_candidate.phone,
        temporary_cv: {},
        source: ""
      }
    }
    
    begin
      HttpTool.post("#{BASE_URL}/campaigns/#{@campaign_id}/campaign_invitations?api_key=#{@api_key}", body, nil)
    rescue Exception => e
      LoggerTool.log_error(e)
      LoggerTool.log_info(body)
    end
  end

  BASE_URL = "https://my.talkpush.com/api/talkpush_services"

end
