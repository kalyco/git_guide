require 'pry'
require_relative 'methods.rb'

def git_debug

  puts "\n\nWelcome to Motel Git Debugger!\n\n"
  puts "Are you here because you have an issue?"
  user_response(response)
  if answer_is_yes
    issue
    issue_type($current_answer)
  else
    non_issue
  end
end

git_debug
