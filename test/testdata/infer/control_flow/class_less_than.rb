# typed: true

class S
end
class A < S
end

sig(a: Class).void
def simple(a)
  if a < A
    T.assert_type!(a, T.class_of(A))
  end
end


sig(a: T.any(T.class_of(Integer), T.class_of(A))).void
def harder(a)
  if a < S
    T.assert_type!(a, T.class_of(A))
  end
end