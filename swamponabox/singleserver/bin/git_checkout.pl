#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use Cwd;

my @git_dirs = qw(db deployment services swamp-web-server www-front-end);
my $branch = $ARGV[0];

sub git_checkout {
	foreach my $git_dir (@git_dirs) {
		my $result = `cd $git_dir; git checkout $branch 2>&1; git pull 2>&1`;
		print "Dir: $git_dir result:\n$result\n\n";
	}
}

if (! defined($branch)) {
	print "Error - no branch - exiting ...\n";
	exit;
}
my $workspace = "$FindBin::Bin/../../../../";
chdir $workspace;
my $cwd = getcwd();
print "Checking out: $branch into: $cwd for: ", (join ', ', @git_dirs), "\n";
git_checkout();
print "Hello World!\n";
