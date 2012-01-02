package Catalyst::Helper::View::Text::Template;
use strict;

=head1 NAME

Catalyst::Helper::View::Text::Template - Helper for Text::Template Views

=head1 SYNOPSIS

  script/create.pl view NameOfMyView Text::Template

=head1 DESCRIPTION

Helper for Text::Template Views.

=head2 METHODS

=head3 mk_compclass

=cut

sub mk_compclass {
  my ($self, $helper) = @_;
  my $file = $helper->{file};
  $helper->render_file('compclass', $file);
}

=head1 SEE ALSO

L<Catalyst::Manual>, L<Catalyst::Test>, L<Catalyst::Request>,
L<Catalyst::Response>, L<Catalyst::Helper>, L<Catalyst::View::Text::Template>

=head1 AUTHOR

Dean Hamstead, C<dean@fragfest.com.au>

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as perl itself.

=cut

1;

__DATA__

__compclass__
package [% class %];

use strict;
use warnings;

use parent 'Catalyst::View::Text::Template';

# URI Escaping, uncomment below and in the HASH config
# use URI::Escape qw( uri_escape );

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tmpl',

# these are added to the HASH *before* the stash is
# this is a good place to insert your helper functions
#    HASH        => {
#
# add this helper by uncommenting the line below
#        escapehtml     => \&_escapeHTML,
#
# add this helper by uncommenting the 'use URI::Escape' and the line below
#        'uri_escape'   => \&uri_escape, 
#
#}, 

# these are all as per Text::Template documentation
#    BROKEN      => \&broken_function,
#    BROKEN_ARGS => \$broken_arg,
#    DELIMITERS  => [ '[@--', '--@]' ],
#    PREPEND     => q|use strict; etc...|,
#    SAFE        => \$safe_cpt,

);

=head2 _escapeHTML

Takes ( $text_to_be_escaped, $escape_whitespace_if_true ).
I<$text_to_be_escaped> is the actual text, the second option
I<$escape_whitespace_if_true> causes whitespace to be escaped
if true. I.e. endlines become br and so forth.

Returns the escaped text;

Lifted from the L<CGI> module.

=cut

sub _escapeHTML {

    my ( $escape, $text ) = @_;
    return undef unless defined $escape;
    $escape =~ s/&/&amp;/g;
    $escape =~ s/"/&quot;/g;
    $escape =~ s/</&lt;/g;
    $escape =~ s/>/&gt;/g;

    # these next optional escapes make text look the same when rendered in HTML
    if ($text) {
        $escape =~ s/\t/    /g;                          # tabs to 4 spaces
        $escape =~ s/( {2,})/"&nbsp;" x length $1/eg;    # whitespace escapes
        $escape =~ s/\n/<br \/>\n/g;                     # newlines to <br />
    }
    return $escape;

}

=head1 NAME

[% class %] - Catalyst Text::Template View for [% app %]

=head1 SYNOPSIS

See L<[% app %]>

=head1 DESCRIPTION

Catalyst Text::Template View for [% app %]

=head1 AUTHOR

[% author %]

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
