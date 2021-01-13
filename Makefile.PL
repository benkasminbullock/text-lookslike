use strict;
use warnings;
use ExtUtils::MakeMaker;

my $pm = 'lib/Text/LooksLike.pm';
my $pod = 'lib/Text/LooksLike.pod';
my $github = 'github.com/benkasminbullock/text-lookslike';
my $repo = "https://$github";
WriteMakefile (
    NAME => 'Text::LooksLike',
    VERSION_FROM => $pm,
    ABSTRACT_FROM => $pod,
    AUTHOR => 'Ben Bullock <bkb@cpan.org>',
    LICENSE => 'perl',
    PREREQ_PM => {
    },
    META_MERGE => {
	'meta-spec' => {
	    version => 2,
	},
        resources => {
            repository => {
		type => 'git',
		url => "git://$github.git",
		web => $repo,
	    },
            bugtracker => {
		web => "$repo/issues",
	    },
#	    homepage => 'http://',
        },
    },
    MIN_PERL_VERSION => '5.006001',
);
