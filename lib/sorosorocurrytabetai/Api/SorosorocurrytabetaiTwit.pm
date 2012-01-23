package sorosorocurrytabetai::Api::SorosorocurrytabetaiTwit;

use strict;
use warnings;
use sorosorocurrytabetai::Schema;

sub new {
	return bless {}, shift;
}

sub all {
	my ($self, $rs) = @_;
	return $rs->all();
}
sub getById_field {
	my ($self, $rs, $id_field) = @_;
	return $rs->search( { id_field => $id_field });
}
sub updateTwitcountById {
	my ($self, $rs, $id, $twit_count ) = @_;
	$rs->find($id)->update({
		twit_count => $twit_count,
	});
}


1;