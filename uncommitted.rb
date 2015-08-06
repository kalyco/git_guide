def save_uncommitted_changes
    save_uncommitted = [
    "1: Commit them on the local branch",
    "2: Commit them on another branch, no checkout conflicts",
    "3: Commit them on another branch, conflicts",
    "4: Commit them on a new branch",
    "5: Stash them.",
  ]
  puts save_uncommitted
  iterate_and_respond(save_uncommitted, 1, 5)
  uncommitted_options($current_answer)
end

def uncommitted_1
	puts "Make sure you've added everything you want with '$git add <file>."
	puts "Use '$git reset"
end

def uncommitted_2
end

def uncommitted_3
end

def uncommitted_4
end

def uncommitted_5
	stash_options
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