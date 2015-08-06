require_relative 'mess.rb'
require_relative 'definitions.rb'
require_relative 'git_interactive.rb'
require_relative 'uncommitted.rb'

$current_answer = nil
$method_value = "git_debug"
$yes = ["yes", "y", "Yes", "YES"]
$no = ["no", "n", "No", "NO"]
$question_type = :yes_no
$invalid_int = false
$done = "then you're all set to keep on gitting ^__^"
$good = "all good?"
$hmm = "let's try ..."
$work_to_do = "Yay good choice! (I don't have this set up yet.)"

def array_iterate(array)
  array.each { |x| puts x }
  puts
end

def answer_is_yes
  $yes.include?($current_answer)
end

def iterate_and_respond(array, first_value, last_value)
  array_iterate(array)
  valid_integer(first_value, last_value)
end

def response
  input = gets.chomp
  return input
end

def valid_integer(start, finish)
  $current_answer = response.to_i
  while $current_answer < start || $current_answer > finish
    $invalid_int = true
    user_response($current_answer)
  end
end

def stash_options
  puts "STASH OPTIONS:\n\n"
  puts "-enter '$git stash' to add any files that are in the index"
  sleep(2)
  puts "-enter '$git stash --keep-index' to not stash anything you've already added with '$git add'"
  sleep(2)
  puts "-enter '$git stash -p' (patch) to manually select any line changes you don't want to stash."
  sleep(2)
  puts "-enter '$git stash -u' (untracked) to additionally store any untracked files you have created.\n\n"
  sleep(5)
end

def user_response(answer)
  if answer == "help"
    help_list
  else
    $current_answer = answer
    if $question_type == :yes_no
      while !$yes.include?(answer) && !$no.include?(answer)
        puts "Please enter a valid response"
        answer = response
      end
    elsif $question_type == :numeric
      while answer.class != Fixnum || $invalid_int == true
        puts "Please enter a valid integer from the list"
        answer = response.to_i
        $current_answer = answer
        $invalid_int = false
      end
    end
  end
    $current_answer
end

def non_issue
  $method_value = "non_issue"
  $question_type = :numeric
  git_topics = [
    "1. Git options",
    "2. Git definitions",
    "3. Git flow",
    "4. GitX"
    ]

  puts "\n\nokie doke"
  puts "Just looking for help?"
  puts "Enter which topic you need help with.\n\n"

  iterate_and_respond(git_topics, 1, 4)
  puts $work_to_do
end

def issue
  $method_value = "issue"
  $question_type = :numeric

  puts "\n\nWhat kind of issue?"
  issue_array = [
    "1. I need to fix a change",
    "2. I've lost some work.",
    "3. My Git history is ugly"
  ]
  iterate_and_respond(issue_array, 1, 3)
end

def commit
  $method_value = "commit"
  puts "has anyone else seen it?"
  $question_type = :yes_no
  user_response(response)
  if answer_is_yes
    puts "that sucks."
  else
    puts "how long ago was it commited?"
    how_long = [
      "1: Probably forever?",
      "2: Last commit"
    ]
    array_iterate(how_long)
    user_response(response)
  end
end

def history
  puts $work_to_do
end

def issue_type(answer)
  if answer == 1
    mess
  elsif answer == 2
    commit
  else
    history
  end
end