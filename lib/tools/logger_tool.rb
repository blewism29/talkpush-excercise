class LoggerTool
  
  def self.log_error (p_e)
    Rails.logger.error( create_line(p_e.inspect, "ERROR") )
  end

  def self.log_info (p_data)
    Rails.logger.info( create_line(p_data, "INFO") )
  end

  def self.create_line (p_data, p_tag)
    "[#{DateTime.now.to_s}] #{p_tag} | #{p_data}"
  end

end
