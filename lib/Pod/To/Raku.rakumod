unit class Pod::To::Raku;

method render($pod) {
  $pod.raku;
}

=begin pod

=head1 NAME

Pod::To::Raku -- Extract Pod into standalone Raku

=head1 SYNOPSIS

  raku --doc=Raku in.raku > out.raku
  raku --doc=Raku in.rakumod > out.raku
  raku --doc=Raku::Plus in.pod > out.raku

=head1 DESCRIPTION

This is a simple way of extracting pod from a file and serializing
it using the `.raku` method.

This can be helpful to separate the pod from a raku module or program
in which it is embedded.  It is designed to be used along with the
command line option `--doc` for the raku executable, as shown above.

=head1 EXAMPLE

Given a file like this named C<add.raku> with some declarator pod:

  #| add two numbers
  sub add($a, $b) {
      $a + $b;
  }

Run

  raku --doc=Raku add.raku

to get

  $[
    Pod::Block::Declarator.new(
        WHEREFORE => sub add ($a, $b) { #`(Sub|3053844670056) ... },
        leading => [["add two numbers"],],
        trailing => [],
        config => {}, contents => []
    )
  ]

=head1 BONUS FEATURES

Also included: C<Pod::To::Raku::Plus> and C<find-raku-module>.

Use C<Raku::Plus> to add the file and line to C<WHEREFORE>:

   raku --doc=Raku::Plus add.raku

which yields

  $[
    Pod::Block::Declarator.new(
        WHEREFORE => {
            :file("add.raku"),
            :line(2),
            :name("add"),
            :sig(:($a, $b))
       },
       leading => [["add two numbers"],], trailing => [], config => {}, contents => [])
    ]

Use C<find-raku-module> to get some metadata (including filenames) for a module:

   find-raku-module JSON::Fast

yields

	{
		"repo-id": "inst",
		"provides": [
			{
				"lib/JSON/Fast.pm6": {
					"file": "F13CDD097310A0775131666979B65ADF692574DD",
					"time": null
				},
				"file": "...moar-2024.12/share/perl6/site/sources/F13CDD097310A0775131666979B65ADF692574DD"
			}
		],
		"meta": {
			"ver": "0.19",
			"source": "F13CDD097310A0775131666979B65ADF692574DD",
			"auth": "cpan:TIMOTIMO",
			"api": "0",
			"checksum": "A498E97EDAC5D22E53386172C9A3EA5670411BCD"
		},
		"JSON::Fast": {
			"lib/JSON/Fast.pm6": "...moar-2024.12/share/perl6/site/sources/F13CDD097310A0775131666979B65ADF692574DD"
		},
		"description": "A naive, fast json parser and serializer; drop-in replacement for JSON::Tiny"
	}

=head1 SEE ALSO

C<Pod::Load>

=end pod
