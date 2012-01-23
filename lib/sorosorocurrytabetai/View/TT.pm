package sorosorocurrytabetai::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config({
    INCLUDE_PATH => [
        sorosorocurrytabetai->path_to( 'root', 'src' ),
        sorosorocurrytabetai->path_to( 'root', 'lib' )
    ],
    PRE_PROCESS  => 'config/main',
    WRAPPER      => 'site/wrapper',
    ERROR        => 'error.tt2',
    TIMER        => 0,
    render_die   => 1,
    ENCODING => 'utf-8',
});

=head1 NAME

sorosorocurrytabetai::View::TT - Catalyst TTSite View

=head1 SYNOPSIS

See L<sorosorocurrytabetai>

=head1 DESCRIPTION

Catalyst TTSite View.

=head1 AUTHOR

User &

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

