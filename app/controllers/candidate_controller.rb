class ApplicationController < ActionController::Base

    def create_new_candidates
      @@helper.create_new_candidates
    end

    @@helper = CandidateHelper.new

end
