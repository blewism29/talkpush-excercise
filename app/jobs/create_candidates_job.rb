class CreateCandidatesJob

  def create_new_candidates
    @@helper.create_new_candidates
  end

  @@helper = CandidateManager.new

end
