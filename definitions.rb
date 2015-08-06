$terms = [
	"amend",
	"checkout",
	"cherry-pick",
	"commit",
	"merge",
	'patch',
	"plumbing",
	"pull",
	"rebase",
	"remote",
	"reset",
	"reflog",
	"rev",
	"stash",
	"tree-ish"
]

def amend
	puts "'$git commit --amend' is a convenient way to fix up the most recent commit."
end

def checkout
	puts "'$git checkout' is a way to navigate to different locations."
	puts " Three Functions:"
	sleep(2)
	puts " - checking out files"
	sleep(2)
	puts " - checking out commits"
	sleep(2)
	puts " - checking out branches\n\n"
end

def reset
	puts "'$git reset: resets current HEAD to the specified state"
	sleep(2)
	puts "Three Forms:"
	sleep(2)
	puts "1: '$git reset [-q] [<tree-ish>] [--] <paths>…'"
	puts "This form "
end

def tree_ish
	puts "'tree-ish' is a term that refers to any identifier"
end

def rev
	puts "'<rev>' is consistently used in Git as a plumbing command."
	puts "'Generally is referring to the 40-character SHA1 hash for a commit."
end

def patch
	puts "this is the difference that you want to apply to the files in your working branch."
	puts "'<patch>' refers to the files to read the patch from.\n\n"
	puts "Other options similar to patch:"
	puts "--stat"
	puts "--summary"
	puts "--check"
end
