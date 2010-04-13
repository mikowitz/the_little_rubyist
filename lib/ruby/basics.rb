def atom?(atom)
  !atom.nil? && atom.respond_to?(:to_sym)
end

def car(list)
  return nil if (atom? list)
  list[0]
end

def cdr(list)
  return nil if (atom? list)
  list[1..-1]
end

def cons(list_or_atom, list)
  return nil if (atom? list)
  [list_or_atom, *list]
end

def null?(list)
  return nil if (atom? list)
  list.empty?
end

def eq?(atom1, atom2)
  return nil if !(atom? atom1) || !(atom? atom2)
  atom1 == atom2
end
