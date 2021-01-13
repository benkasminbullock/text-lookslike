package Text::LooksLike;
use warnings;
use strict;
use Carp;
use utf8;
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw/looks_like/;
our %EXPORT_TAGS = (
    all => \@EXPORT_OK,
);

our $VERSION = '0.00_01';

our $database_command = qr!
union
|
select
|
drop\s+table
|
sleep\s*\(
|
order\s+by
!xi;

our $hate_mail = qr!
kill\s+yourself
!xi;

our $up_path = qr!
(\.\./)+
!x;

our $phone_number = qr!^
(?:\+?[0-9]+)?
\s*
(?:
    \(\s*[0-9]+\s*\)
|
    [0-9]+
)
\s*
(?:
[0-9]+
\s*
(?:-|\s)
\s*
)+
[0-9]+\s*$
!x;

our $javascript = qr!
<script\s*>
!x;

our $url = qr!
https?://
!xi;

our $spam = qr!
top\s+rated\s+seller
|
buy\s+it\s+now
!xi;

our $email = qr!
\@[a-z]+\.[a-z]+
!xi;

our $file = qr!
^\s*
\S+
\.
(xml|js|json)
\s*$
!x;

sub looks_like
{
    my ($text) = @_;
    if ($text =~ $database_command) {
	return "database command";
    }
    if ($text =~ $hate_mail) {
	return "hate mail";
    }
    if ($text =~ $up_path) {
	return "directory path";
    }
    if ($text =~ $phone_number) {
	return "phone number";
    }
    if ($text =~ $javascript) {
	return "javascript";
    }
    if ($text =~ $url) {
	return "url";
    }
    if ($text =~ $spam) {
	return "spam";
    }
    if ($text =~ $file) {
	return "file";
    }
}

1;
