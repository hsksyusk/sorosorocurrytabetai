package sorosorocurrytabetai::Schema::Result::Comment;

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

sorosorocurrytabetai::Schema::Result::Comment

=cut

__PACKAGE__->table("COMMENT");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 from_userid

  data_type: 'integer'
  is_nullable: 0

=head2 to_userid

  data_type: 'integer'
  is_nullable: 0

=head2 asin

  data_type: 'char'
  is_nullable: 0
  size: 10

=head2 comment

  data_type: 'text'
  is_nullable: 0

=head2 timestamp

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "from_userid",
  { data_type => "integer", is_nullable => 0 },
  "to_userid",
  { data_type => "integer", is_nullable => 0 },
  "asin",
  { data_type => "char", is_nullable => 0, size => 10 },
  "comment",
  { data_type => "text", is_nullable => 0 },
  "timestamp",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-05-13 21:59:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:og9z/HuIqsP0gqPJ18bJOQ


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
