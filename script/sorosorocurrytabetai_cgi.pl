#!/usr/bin/env perl
use lib '/home/hsksyusk/local/lib/perl5';
use local::lib;
use lib "$FindBin::Bin/../lib";

use Catalyst::ScriptRunner;
Catalyst::ScriptRunner->run('sorosorocurrytabetai', 'CGI');

1;

=head1 NAME

sorosorocurrytabetai_cgi.pl - Catalyst CGI

=head1 SYNOPSIS

See L<Catalyst::Manual>

=head1 DESCRIPTION

Run a Catalyst application as a cgi script.

=head1 AUTHORS

Catalyst Contributors, see Catalyst.pm

=head1 COPYRIGHT

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

