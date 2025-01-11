[![Actions Status](https://github.com/bduggan/raku-pod-to-raku/actions/workflows/linux.yml/badge.svg)](https://github.com/bduggan/raku-pod-to-raku/actions/workflows/linux.yml)
[![Actions Status](https://github.com/bduggan/raku-pod-to-raku/actions/workflows/macos.yml/badge.svg)](https://github.com/bduggan/raku-pod-to-raku/actions/workflows/macos.yml)

NAME
====

Pod::To::Raku -- Extract Pod into standalone Raku

SYNOPSIS
========

    raku --doc=Raku in.raku > out.raku
    raku --doc=Raku in.rakumod > out.raku
    raku --doc=Raku::Plus in.pod > out.raku

DESCRIPTION
===========

This is a simple way of extracting pod from a file and serializing it using the `.raku` method.

This can be helpful to separate the pod from a raku module or program in which it is embedded. It is designed to be used along with the command line option `--doc` for the raku executable, as shown above.

EXAMPLE
=======

Given a file like this named `add.raku` with some declarator pod:

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

BONUS FEATURES
==============

Also included: `Pod::To::Raku::Plus` and `find-raku-module`.

Use Raku::Plus to get the pod with the line number and filename:

    raku --doc=Raku::Plus add.raku

which yields

    $[
      Pod::Block::Declarator.new(
          WHEREFORE => {
              :file("eg/in.raku"),
              :line(2),
              :name("add"),
              :sig(:($a, $b))
         },
         leading => [["add two numbers"],], trailing => [], config => {}, contents => [])
      ]

Use `find-raku-module` to find the location of the module in the filesystem:

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

SEE ALSO
========

`Pod::Load`

