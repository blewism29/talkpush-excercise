require 'clockwork'
require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  constants = Constants.get_instance
  create_candidates_job = CreateCandidatesJob.new  

  Clockwork.every(constants.CREATE_CANDIDATE_JOB_TIME_INTERVAL.minutes, 'Create new candidates') {
    puts "START | Creating new candidates"
    create_candidates_job.create_new_candidates()
    puts "END | Create new candidates"
  }
end

#---- Triggers clockwork -----#
TalkpushExcercise::Application.configure do
	config.after_initialize do
		Thread.new do
			Clockwork.run
		end
	end
end