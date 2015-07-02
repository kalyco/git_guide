$current_answer = nil
$yes = ["yes", "y", "Yes", "YES"]
$no = ["no", "n", "No", "NO"]
$question_type = :yes_no
$invalid_int = false

def response
  input = gets.chomp
  return input
end

def user_response(answer)
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
  $current_answer
end

def non_issue
  $question_type = :numeric
  git_topics = [
    "1. Git options",
    "2. Git definitions"
    ]

  puts "\n\nokie doke"
  puts "Just looking for help?"
  puts "Enter which topic you need help with.\n\n"

  git_topics.each { |x| puts x }
  puts
  $current_answer = response.to_i
  while $current_answer < 1 || $current_answer > 2
    $invalid_int = true
    user_response($current_answer)
  end
  puts "This will eventually cover multiple generalized help topics"
end

def issue
  $question_type = :numeric

  puts "\n\nWhat kind of issue?"
  issue_array = [
    "0. An uncommited mess",
    "1. I accidentally commited something",
    "2. My Git history is ugly"
  ]
  issue_array.each { |x| puts x }
  puts
  $current_answer = response.to_i
  while $current_answer < 0 || $current_answer > 3
    $invalid_int = true
    user_response($current_answer)
  end

  def issue_type
end
