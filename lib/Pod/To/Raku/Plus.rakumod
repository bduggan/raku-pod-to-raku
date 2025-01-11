unit class Pod::To::Raku::Plus;

method render($pod) {
  Sub.^find_method('raku').wrap: -> $sub { %( line => $sub.line, file => $sub.file, sig => $sub.signature, name => $sub.name ).raku}
  $pod.raku;
}
