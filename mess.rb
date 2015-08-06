
def mess
  $method_value = "mess"
  puts "Fix a Change:\n\n"
  puts "Where are you?"
  change_issues = [
    "1. I have not committed yet",
    "2. I've made a commit",
    "3. I am in the middle of a bad merge",
    "4. I am in the middle of a bad rebase"
  ]
  iterate_and_respond(change_issues, 1, 4)
  change_issue_choice($current_answer)
end


def change_issue_choice(answer)
  if answer == 1
    have_not_committed
  elsif answer == 2
    made_a_commit
  elsif answer == 3
    middle_of_merge
  else
    middle_of_rebase
  end
end

def have_not_committed
  puts "Have Not Committed:\n\n"
  puts "Do you care about your mess enough to keep it?\n\n"
  $question_type = :yes_no
  user_response(response)
  puts "What do you need to save?"
  if answer_is_yes
    save_things = [
      "1. Save some stuff",
      "2. Save all the things!"
    ]
    $question_type = :numeric
    iterate_and_respond(save_things, 1, 2)
    if $current_answer == 1
      puts "Okay. So you have not yet committed and want to undo some added changes?\n\n"
      puts "1: Check '$git status' to see where you're at. "
      puts "2: Using '$git checkout --<file>' makes any changes to that file irrecoverable.\n\n"
      puts "So, if you want to work on a smaller scale, you have a few choices.\n\n"
      stash_options
      puts $good
      $question_type = :yes_no
      user_response(response)
      if answer_is_yes
        puts "awesome! yay help!"
      else 
        puts "hmm, what's the issue?"
        still_issue = [
          "1: Don't want to stash.",
          "2: Added files I don't want.",
          "3: Move changes to new branch."
        ]
      end
    else 
      puts "there are 5 ways to save uncommitted changes:"
      save_uncommitted_changes
    end
  else
    puts "1: revert all local uncommitted changes."
    puts "2: revert all uncommited changes to a particular file or directory."
    sleep(5)
    puts $good
    user_response(response)
    if answer_is_yes
        puts "enter '$get checkout .'"
        puts "this will revert all local uncommited changes"
    else 
      puts $good
      user_response(response)
    end
  end
end


# puts "split off a logical chunk of your mess with 'git add <filename>.'"
# sleep(5)
# puts "commit it in a short message with '$git commit -m '<message content>',"
# puts "or stash it with '$git stash' if you still have work to do and want to do"
# puts "some work on another branch."
# sleep(5)
# puts $good
# user_response(response)
# if answer_is_yes
#   puts $done
# else
#   puts $hmm
# end