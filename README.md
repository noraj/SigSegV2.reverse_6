# Matz 2.3

## Version

Date        | Author                  | Contact               | Version | Comment
---         | ---                     | ---                   | ---     | ---
27/10/2019  | noraj (Alexandre ZANNI) | noraj#0833 on discord | 1.0     | Document creation

## Information

Information displayed for CTF players:

+ **Name of the challenge** / **Nom du challenge**: `Matz 2.3`
+ **Category** / **Catégorie**: `Reverse`
+ **Internet**: not needed
+ **Difficulty** / **Difficulté**: easy / facile

### Description

```
Haaaaa the script was removed by SIben, only this weird file is left :/
Helppppppp me!

Flag format: sigsegv{flag}

author: [noraj](https://pwn.by/noraj/)
```

### Hints

- Hint1: Ruby
- Hint2: bytecode

## Integration

Just share the `.rbc` file.

## Solving

### Author solution

- `.rb` (Ruby) --> `.rbc` same as `.py` (Python) --> `.pyc`, the c stands for compiled
- `.rbc` is some ruby bytecode
- (The title `Matz 2.3` can help; *Matz* is the ruby creator's nickname and `2.3` is the ruby version where bytecode compilation was introduced)
- OSINT skill: *How to compile Ruby?*: https://stackoverflow.com/questions/5902334/how-to-compile-ruby/44613584#44613584
- OSINT skill: *RubyVM::InstructionSequence*: https://ruby-doc.org/core-2.6.5/RubyVM/InstructionSequence.html
- disassemble the bytecode in human readble instructions (use `load.rb`)

Obtains something like that:

```
$ ruby load.rb 
== disasm: #<ISeq:<main>@script.rb:1 (1,0)-(44,19)> (catch: FALSE)
local table (size: 1, argc: 0 [opts: 0, rest: -1, post: 0, block: -1, kw: -1@-1, kwrest: -1])
[ 1] a198563@0
0000 newarray                     0                                   (   1)[Li]
0002 setlocal_WC_0                a198563@0
0004 getlocal_WC_0                a198563@0                           (   2)[Li]
0006 putobject                    29
0008 putobject                    116
0010 opt_aset                     <callinfo!mid:[]=, argc:2, ARGS_SIMPLE>, <callcache>
0013 pop
0014 getlocal_WC_0                a198563@0                           (   3)[Li]
0016 putobject                    16
0018 putobject                    99
0020 opt_aset                     <callinfo!mid:[]=, argc:2, ARGS_SIMPLE>, <callcache>
0023 pop
0024 getlocal_WC_0                a198563@0                           (   4)[Li]
0026 putobject                    31
0028 putobject                    95
0030 opt_aset                     <callinfo!mid:[]=, argc:2, ARGS_SIMPLE>, <callcache>
...
```

`a198563` is the array name, `29` is the array index, `116` is the value assigned to it.

Retrieve all values. You will end with something like in `script.rb`.

Then transform the array of int into ASCII text:

```ruby
puts a198563.map{|i| i.chr}.join
```

## Flag

`sigsegv{you_c4n_c0mp1le_ruby_t0_bytec0de}`
