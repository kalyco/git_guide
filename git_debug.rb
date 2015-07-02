require 'pry'
require_relative 'methods.rb'

def git_debug

  puts "Welcome to git debugger!\n\n"
  puts "Are you here because you have an issue?"
  user_response(response)
  if $yes.include?($current_answer)
    issue
    issue_type($current_answer)
  else
    non_issue
  end
end

git_debug
