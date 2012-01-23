package sorosorocurrytabetai;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
	Authentication
	Session
	Session::PerUser
	Session::Store::File
	Session::State::Cookie
	Unicode
	FormValidator::Simple
	FormValidator::Simple::Auto
	I18N
/;

extends 'Catalyst';

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in sorosorocurrytabetai.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'sorosorocurrytabetai',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
	ENCODING => 'UTF-8',
	default_view => 'TT',
	TEMPLATE_EXTENSION => '.tt',

	"Plugin::Session" => {
	},

	"Plugin::Authentication" => {
		default_realm => "twitter",
		realms => {
			twitter => {
				credential => {
					class => "Twitter", 
				},
				store => {
					class => 'DBIx::Class', 
					user_model => 'hsksyusk::SorosorocurrytabetaiUser',
				},
				auto_create_user => 1,
				consumer_key	=> 'CIsvztg5A1Bh7qZsaNbBg',
				consumer_secret => 'LmXEH6QLRwmT8XPWvYgWMstGcLj1gDf0gwcD04Aab4', 
				callback_url => 'http://hsksyusk.jeez.jp/sorosorocurrytabetai/callback',
			},
		},
	},
	 
	'validator' => {
		plugins => [qw/Japanese/],
		options => {
			charset => 'utf8',
		},
		profiles => __PACKAGE__->path_to('conf/profiles.yml'),
		messages => __PACKAGE__->path_to('conf/messages.yml'),
		message_decode_from => 'utf-8',
	},
	'View::JSON' => {
		allow_callback  => 1,
	},

);

# Start the application
__PACKAGE__->setup();


=head1 NAME

sorosorocurrytabetai - Catalyst based application

=head1 SYNOPSIS

    script/sorosorocurrytabetai_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<sorosorocurrytabetai::Controller::Root>, L<Catalyst>

=head1 AUTHOR

User &

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
