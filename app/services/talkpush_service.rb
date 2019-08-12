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
    HttpTool.post("http://localhost:8080?api_key=#{@api_key}", body, nil)
  end

  BASE_URL = "https://my.talkpush.com/api/talkpush_services"

end
