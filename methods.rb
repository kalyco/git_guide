$current_answer = nil
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
end

def answer_is_yes
  $yes.include?($current_answer)
end

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
    "2. Git definitions",
    "3. Git flow",
    "4. GitX"
    ]

  puts "\n\nokie doke"
  puts "Just looking for help?"
  puts "Enter which topic you need help with.\n\n"

  array_iterate(git_topics)
  puts
  $current_answer = response.to_i
  while $current_answer < 1 || $current_answer > 4
    $invalid_int = true
    user_response($current_answer)
  end
  puts $work_to_do
end

def issue
  $question_type = :numeric

  puts "\n\nWhat kind of issue?"
  issue_array = [
    "1. An uncommited mess",
    "2. I accidentally commited something",
    "3. My Git history is ugly"
  ]
  array_iterate(issue_array)
  puts
  $current_answer = response.to_i
  while $current_answer < 1 || $current_answer > 3
    $invalid_int = true
    user_response($current_answer)
  end

  def mess
    puts "Uncommited Mess:\n\n"
    puts "Do you care enough about your mess to keep it?"
    $question_type = :yes_no
    user_response(response)
    if answer_is_yes
      puts "split off a logical chunk of your mess, stage it, and commit it with a good message."
      sleep(5)
      puts $good
      user_response(response)
      if answer_is_yes
        puts $done
      else
        puts $hmm
      end
    else
      puts "$git reset --hard"
      sleep(5)
      puts $good
      user_response(response)
      if answer_is_yes
        puts $done
      else
        puts $hmm
      end
    end
  end

  def commit
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
end
