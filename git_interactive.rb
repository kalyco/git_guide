
def help_list
  puts "Welcome to Git Interactive Help Tutorial!"
  puts "please enter a 1-word git topic to learn more about certain methods."
  puts "you can also type 'exit' at any time to leave the tutorial.\n\n"
  git_tutorial(response)
end

def git_tutorial(answer)
  if answer == "exit"
    send($method_value)
  else
    puts "this will take a bit of metaprogramming"
  end
end