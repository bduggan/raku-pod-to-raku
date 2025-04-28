#| before subset
subset Positive of Int where * > 0; #= after subset

#| before enum
enum Frobnicate <Yes No>;  #= after enum

#| before regex
my regex zippo { z }  #= after regex

#| before block
{ … } #= after block

#| before pointy block
{ … } #= after pointy block

#| the main class
class A {  #= that we have

    #| a method before
    multi method a( #= method after
      #| parameter before
      Int:D $foo #= parameter after
    ) {
        #| a variable
        my $a = 42; #= with the answer
    }
}
