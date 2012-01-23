#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use local::lib;
use Path::Class::File;
use Net::Twitter;
use DateTime;
use DateTime::Format::W3CDTF;
use DateTime::Format::MySQL;
use DateTime::Format::DateParse;

BEGIN {
    my $lib = Path::Class::File->new(__FILE__)->parent->parent->subdir('lib');
    unshift @INC, $lib->absolute->stringify;
}
use sorosorocurrytabetai::Api::SorosorocurrytabetaiTwit;
use sorosorocurrytabetai::Api::SorosorocurrytabetaiSearch;
use sorosorocurrytabetai::Api::SorosorocurrytabetaiTimeline;
use sorosorocurrytabetai::Schema;

my $schema = sorosorocurrytabetai::Schema->connection(
	'dbi:mysql:database=hsksyusk:host=mysql231.db.sakura.ne.jp',
	'hsksyusk',
	'root16',
	{
		AutoCommit => 1,
		mysql_enable_utf8 => 1,
		on_connect_do => [
			"SET NAMES utf8",
			"SET CHARACTER SET 'utf8'",
		],
	},
);

my $twitschema = sorosorocurrytabetai::Api::SorosorocurrytabetaiTwit->new();
my $timelineschema = sorosorocurrytabetai::Api::SorosorocurrytabetaiTimeline->new();

#my @twits = $twitschema->getById_field($schema->resultset('SorosorocurrytabetaiTwit'),1);
my @twits = $twitschema->all($schema->resultset('SorosorocurrytabetaiTwit'));
foreach my $curry_twit ( @twits ){
	if ( defined $curry_twit->search_id ) {
		$timelineschema->update_or_new(
			$schema->resultset('SorosorocurrytabetaiTimeline'),
			$curry_twit->id,
			$curry_twit->search_id->since_id,
		);
	}
}
