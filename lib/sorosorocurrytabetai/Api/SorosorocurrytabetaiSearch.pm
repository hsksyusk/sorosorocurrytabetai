package sorosorocurrytabetai::Api::SorosorocurrytabetaiSearch;

use strict;
use warnings;
use sorosorocurrytabetai::Schema;

sub new {
	return bless {}, shift;
}

sub getById {
	my ($self, $rs, $id) = @_;
	return $rs->find($id);
}

sub update_or_new {
	my ($self, $rs, $id, $lastfind_date, $lastfind_text, $since_id) = @_;
	my $twit_search = $rs->update_or_new({
		id => $id,
		lastfind_date => $lastfind_date,
		lastfind_text => $lastfind_text,
		since_id => $since_id,
	});
	if ( !$twit_search->in_storage ) {
		$twit_search->insert();
	}
}

1;
