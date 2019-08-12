class FileTool

  def write_data_to_file (p_filename, p_data)
    File.open(p_filename, 'w') do |file|  
      file.write(p_data.to_s)
    end
  end

  def read_data_from_file (p_filename, p_default_value)
    File.exist?(p_filename) ? File.read(p_filename) : p_default_value.to_s
  end

end
