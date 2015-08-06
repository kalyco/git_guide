def save_uncommitted_changes
    save_uncommitted = [
    "1: Commit them on the local branch",
    "2: Commit them on another branch, no checkout conflicts",
    "3: Commit them on another branch, resolve conflicts",
    "4: Commit them on a new branch",
    "5: Stash them.",
  ]
  puts save_uncommitted
  iterate_and_respond(save_uncommitted, 1, 5)
  uncommitted_options($current_answer)
  check_if_all_set
end

def uncommitted_1
	puts "Commit on a local branch:\n\n"
	puts "To scratch current work:"
	puts "Use '$git reset' for all or '$git reset <file>' for a specific change."
	puts "Commit:"
	puts "Make sure you've added everything you want with '$git add <file>."
	puts "enter '$git commit -m '<your message'>' "
end

def uncommitted_2
	puts "Commit on another branch without conflicts:\n\n"
	puts "Enter $git checkout <otherbranch>'"
	puts "Enter git commit -am '<message>'"
end

def uncommitted_3
	puts "Commit on another branch, resolve conflicts:\n\n"
	puts "Enter '$git stash'"
	puts "Enter '$git checkout <otherbranch>'"
	puts "Enter '$git stash apply'\n\n" 
	puts "At this point you will need to resolve the merge conflicts with your other branch.\n\n"
	puts "If you need help doing this type 'resolve'\n\n"
	puts "Enter '$git commit -am '<message>''"
	puts "Enter '$git stash drop'"
end

def uncommitted_4
end

def uncommitted_5
	stash_options
end

def check_if_all_set
end

def resolve_coflicts
	puts "How to resolve merge conflicts:\n\n"
	puts "Check '$git status"
	puts "Check the patchset with '$git fetch'"
	puts "This checks out the right patch (output difference) from your git commit"
end


def uncommitted_options(response)
  if response == 1
    uncommitted_1
  elsif response == 2
    uncommitted_2
  elsif response == 3
    uncommitted_3
  elsif response == 4
    uncommitted_4
  else
    uncommitted_5
  end
end