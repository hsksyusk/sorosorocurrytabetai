package sorosorocurrytabetai::Schema::Result::SorosorocurrytabetaiTimeline;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

sorosorocurrytabetai::Schema::Result::SorosorocurrytabetaiTimeline

=cut

__PACKAGE__->table("SOROSOROCURRYTABETAI_TIMELINE");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 since_id

  data_type: 'bigint'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "since_id",
  { data_type => "bigint", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-05-18 10:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IoMxPgnbR7x4dUbSw/drIQ
__PACKAGE__->belongs_to(twit_id => 'sorosorocurrytabetai::Schema::Result::SorosorocurrytabetaiTwit', 'id');


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
