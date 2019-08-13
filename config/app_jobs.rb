require 'clockwork'
require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)

Clockwork.every(5.minutes, 'Create new candidates') {
  puts "START | Creating new candidates"
  CREATE_CANDIDATE_JOBS.create_new_candidates()
  puts "END | Create new candidates"
}
  
CREATE_CANDIDATE_JOBS = CreateCandidatesJob.new  

