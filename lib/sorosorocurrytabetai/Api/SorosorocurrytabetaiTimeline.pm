package sorosorocurrytabetai::Api::SorosorocurrytabetaiTimeline;

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
	my ($self, $rs, $id, $since_id) = @_;
	my $twit_timeline = $rs->update_or_new({
		id => $id,
		since_id => $since_id,
	});
	if ( !$twit_timeline->in_storage ) {
		$twit_timeline->insert();
	}
}

1;
