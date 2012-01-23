package sorosorocurrytabetai::Controller::Root;
use Moose;
use namespace::autoclean;
use utf8;
use Data::Dumper;
use Data::Page::Navigation;
use DateTime;
use DateTime::Format::MySQL;
use DateTime::Format::W3CDTF;
use String::Random;
use Switch;
use LWP::Simple;
use XML::RSS;
use Net::Twitter;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

sorosorocurrytabetai::Controller::Root - Root Controller for sorosorocurrytabetai

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
}

sub setting :Local {
	my ($self, $c) = @_;
	my $regist_error = 0;
	if ( $c->user_exists) {
		$c->stash->{errorflag} = 0;
		if ($c->req->method eq 'POST' ) {
			if ( $c->req->param('submit') eq 'add' ) {
				if ( $c->form->has_error ) {
					$c->stash->{messages} = $c->form->messages('setting');
					$c->stash->{errorflag} = 1;
					$c->stash->{registerrorflag} = 1;
					$c->stash->{fillform}->{period}  = $c->req->param('period');
					$c->stash->{fillform}->{keyword} = $c->req->param('keyword');
					$c->stash->{fillform}->{message} = $c->req->param('message');
				} else {
					$c->model('hsksyusk::SOROSOROCURRYTABETAITWIT')->create({
						id_field => $c->user->get('id_field'),
						keyword	=> $c->req->param('keyword'),
						message => $c->req->param('message'),
						period	=> $c->req->param('period'),
						twit_count	=> 0,
						twit_count_set	=> 0,
						period	=> $c->req->param('period'),
						create_date	=> \'NOW()',
						update_date	=> \'NOW()',
					});
				}
			} elsif ( $c->req->param('submit') eq 'moretwit' ) {
				$c->model('hsksyusk::SOROSOROCURRYTABETAITWIT')->find( $c->req->param('id') )->update({
					twit_count	=> 0,
				});
			} elsif ( $c->req->param('submit') eq 'update' ) {
				if ( $c->form->has_error ) {
					$c->stash->{messages} = $c->form->messages('setting');
					$c->stash->{errorflag} = 1;
				} else {
					$c->model('hsksyusk::SOROSOROCURRYTABETAITWIT')->find( $c->req->param('id') )->update({
						keyword	=> $c->req->param('keyword'),
						message => $c->req->param('message'),
						period	=> $c->req->param('period'),
						twit_count	=> 0,
						update_date	=> \'NOW()',
					});
					my $search = $c->model('hsksyusk::SOROSOROCURRYTABETAISEARCH')->find( $c->req->param('id') );
					if ( defined $search ){
						$search->delete();
					}
				}
			} elsif ( $c->req->param('submit') eq 'remove' ) {
				my $search = $c->model('hsksyusk::SOROSOROCURRYTABETAISEARCH')->find( $c->req->param('id') );
				if ( defined $search ){
					$search->delete();
				}
				$c->model('hsksyusk::SOROSOROCURRYTABETAITWIT')->find( $c->req->param('id') )->delete();
			}
		}
		$c->stash->{twits} = [$c->model('hsksyusk::SOROSOROCURRYTABETAITWIT')->search(
			{ id_field => $c->user->get('id_field'), },
			{ order_by => { -asc => 'id' },}
		)];
	} else {
		$c->res->redirect("twitter_login"); 
	}
}

sub test :Local {
    my ( $self, $c ) = @_;


	my $regist_error = 0;
	if ( $c->user_exists) {
		$c->stash->{errorflag} = 0;
		if ($c->req->method eq 'POST' ) {
			if ( $c->req->param('submit') eq 'add' ) {
				if ( $c->form->has_error ) {
					$c->stash->{messages} = $c->form->messages('setting');
					$c->stash->{errorflag} = 1;
					$c->stash->{registerrorflag} = 1;
					$c->stash->{fillform}->{period}  = $c->req->param('period');
					$c->stash->{fillform}->{keyword} = $c->req->param('keyword');
					$c->stash->{fillform}->{message} = $c->req->param('message');
				} else {
					$c->model('hsksyusk::SOROSOROCURRYTABETAITWIT')->create({
						id_field => $c->user->get('id_field'),
						keyword	=> $c->req->param('keyword'),
						message => $c->req->param('message'),
						period	=> $c->req->param('period'),
						twit_count	=> 0,
						twit_count_set	=> 0,
						period	=> $c->req->param('period'),
						create_date	=> \'NOW()',
						update_date	=> \'NOW()',
					});
				}
			} elsif ( $c->req->param('submit') eq 'moretwit' ) {
				$c->model('hsksyusk::SOROSOROCURRYTABETAITWIT')->find( $c->req->param('id') )->update({
					twit_count	=> 0,
				});
			} elsif ( $c->req->param('submit') eq 'update' ) {
				if ( $c->form->has_error ) {
					$c->stash->{messages} = $c->form->messages('setting');
					$c->stash->{errorflag} = 1;
				} else {
					$c->model('hsksyusk::SOROSOROCURRYTABETAITWIT')->find( $c->req->param('id') )->update({
						keyword	=> $c->req->param('keyword'),
						message => $c->req->param('message'),
						period	=> $c->req->param('period'),
						twit_count	=> 0,
						update_date	=> \'NOW()',
					});
					my $search = $c->model('hsksyusk::SOROSOROCURRYTABETAISEARCH')->find( $c->req->param('id') );
					if ( defined $search ){
						$search->delete();
					}
				}
			} elsif ( $c->req->param('submit') eq 'remove' ) {
				my $search = $c->model('hsksyusk::SOROSOROCURRYTABETAISEARCH')->find( $c->req->param('id') );
				if ( defined $search ){
					$search->delete();
				}
				$c->model('hsksyusk::SOROSOROCURRYTABETAITWIT')->find( $c->req->param('id') )->delete();
			}
		}
		$c->stash->{twits} = [$c->model('hsksyusk::SOROSOROCURRYTABETAITWIT')->search(
			{ id_field => $c->user->get('id_field'), },
			{ order_by => { -asc => 'id' },}
		)];
	} else {
		$c->res->redirect("twitter_login"); 
	}
}

sub test2: Local {
	my ($self, $c) = @_;
	if ( $c->user_exists) {

		my $twitter = Net::Twitter->new(
			traits => [qw/API::REST API::Search OAuth WrapError/],
			consumer_key    => 'CIsvztg5A1Bh7qZsaNbBg',
			consumer_secret => 'LmXEH6QLRwmT8XPWvYgWMstGcLj1gDf0gwcD04Aab4',
			ssl => 1,
		);
		$twitter->access_token       ($c->user->get('twitter_access_token'));
		$twitter->access_token_secret($c->user->get('twitter_access_token_secret'));

#		my $status = $twitter->show_status($c->user->get('twitter_user_id'));
#		my $user = $twitter->show_user($c->user->get('twitter_user_id'));

#		$c->response->body( Data::Dumper->Dump( [ $status ], [ '$status' ] ) );
		$c->stash->{time_zone} = $twitter->show_user($c->user->get('twitter_user_id'))->{time_zone};
		$c->stash->{twits} = [$c->model('hsksyusk::SOROSOROCURRYTABETAITWIT')->search(
			{ id_field => $c->user->get('id_field'), },
			{ order_by => { -asc => 'id' },}
		)];

	}
}
=comment
sub twit: Local {
	my ($self, $c) = @_;
	if ( $c->user_exists) {
		my $twit = Net::Twitter->new(
			traits => [qw/API::REST OAuth WrapError/],
			consumer_key    => $c->config->{'Plugin::Authentication'}->{realms}->{twitter}->{consumer_key},
			consumer_secret => $c->config->{'Plugin::Authentication'}->{realms}->{twitter}->{consumer_secret},
			ssl => 1,
		);
		$twit->access_token       ($c->user->get('twitter_access_token'));
		$twit->access_token_secret($c->user->get('twitter_access_token_secret'));
		$twit->update('もへもへ');
		$c->response->body( 'もへもへとつぶやきました。' );
	} else {
		$c->res->redirect("twitter_login"); 
	}
}

sub search: Local {
	my ($self, $c) = @_;
	if ( $c->user_exists) {
		my $keyword = 'あばばばば';
		my $twit = Net::Twitter->new(
			traits => [qw/API::Search OAuth WrapError/],
			consumer_key    => $c->config->{'Plugin::Authentication'}->{realms}->{twitter}->{consumer_key},
			consumer_secret => $c->config->{'Plugin::Authentication'}->{realms}->{twitter}->{consumer_secret},
			ssl => 1,
		);
		$twit->access_token       ($c->user->get('twitter_access_token'));
		$twit->access_token_secret($c->user->get('twitter_access_token_secret'));
		my $response = $twit->search({ q => $keyword . ' from:' . $c->user->get('twitter_user'), since_id => '68950959425994754' });
		my $output;
		foreach my $tweet ( @{ $response->{results} } ) {
#			my $created_at = $tweet->{created_at};
#			my $time = datetime_jst($created_at);
#			my $user = color("bold red") . $tweet->{from_user} . color("reset");
			$output = $output . $tweet->{text} . " Max_ID=" . $tweet->{max_id} . "\n";
		}
		$c->response->body( $output );
	} else {
		$c->res->redirect("twitter_login"); 
	}
}
=cut

sub twitter_login : Local {
	my ($self, $c) = @_;
	my $realm = $c->get_auth_realm('twitter');
	$c->res->redirect( $realm->credential->authenticate_twitter_url($c) );
}
sub logout : Local {
    my ($self, $c) = @_;
    $c->logout();
    $c->response->redirect("/sorosorocurrytabetai/");
}

sub callback : Local {
	my ($self, $c) = @_;
	if ($c->authenticate(undef,'twitter')) {
    	$c->response->redirect("/sorosorocurrytabetai/setting");
	} 
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.
=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

User &

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
