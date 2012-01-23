package sorosorocurrytabetai::Api::SorosorocurrytabetaiSearch;

use strict;
use warnings;
use sorosorocurrytabetai::Schema;

sub new {
	my ($self, $c) = @_;
	my $self = { Schema =>
		sorosorocurrytabetai::Schema->connect (
			
			'dbi:mysql:hsksyusk',
			'hsksyusk',
			'root16',
			{
				on_connect_do => "SET NAMES utf8",
			},
		)
	};
	return bless $self, $class;
}

sub getById {
	my ($self, $id) = @_;
	my $rs = $self->{Schema}->resultset('SorosorocurrytabetaiSearch');
	return [$rs->find( { id => $id })];
}

sub create {
	my ($self, $id, $lastfind_date, $lastfind_text, $since_id) = @_;
	$self->{Schema}->resultset('SorosorocurrytabetaiSearch')->create({
		id => $id,
		lastfind_date => $lastfind_date,
		lastfind_text => $lastfind_text,
		since_id => $since_id,
	});
}

sub update {
	my ($self, $id, $lastfind_date, $lastfind_text, $since_id) = @_;
	$self->{Schema}->resultset('SorosorocurrytabetaiSearch')->find( $id )->update({
		lastfind_date => $lastfind_date,
		lastfind_text => $lastfind_text,
		since_id => $since_id,
	});
}


