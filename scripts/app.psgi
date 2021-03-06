my $app    = Plack::App::IndexFile->new({ root => shift })->to_app;

package Plack::App::IndexFile;

use parent 'Plack::App::File';

sub locate_file
{
    my ($self, $env) = @_;
    my $path         = $env->{PATH_INFO} || '';

    return $self->SUPER::locate_file( $env ) unless $path && $path =~ m{/$};
    $env->{PATH_INFO} .= 'index.html';
    return $self->SUPER::locate_file( $env );
}

