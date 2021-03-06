---
id: noreturn
title: T.noreturn
---

> TODO: This page is still a fragment. Contributions welcome!

```ruby
T.noreturn
```

This indicates that a method never returns. Some examples of things that never
return are: infinite loops, exiting the program, and raising exceptions.

This powers dead code analysis. If you try to do something with a value of type
`T.noreturn`, you will get an unreachable code error.

```ruby
# typed: true
extend T::Sig

sig {returns(T.noreturn)}
def infinitely_loops
  loop {}
end

sig {returns(T.noreturn)}
def exits_program
  exit
end

sig {returns(T.noreturn)}
def always_raises
  raise RuntimeError
end

puts foo # error: This code is unreachable
```

`T.noreturn` is a subtype of every type, but no type except `T.noreturn`
(trivially) and `T.untyped` is a subtype of `T.noreturn`.
