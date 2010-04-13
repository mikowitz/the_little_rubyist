def rember(atom, list)
  case
  when (null? list) then []
  when (eq? (car list), atom) then (cdr list)
  else (cons (car list), (rember atom, (cdr list)))
  end
end

def multirember(atom, list)
  case
  when (null? list) then []
  when (eq? (car list), atom) then (multirember atom, (cdr list))
  else (cons (car list), (multirember atom, (cdr list)))
  end
end

def firsts(list)
  case
  when (null? list) then []
  else (cons (car (car list)), (firsts (cdr list)))
  end
end

def insertR(new, old, list)
  case
  when (null? list) then []
  when (eq? (car list), old) then (cons old, (cons new, (cdr list)))
  else (cons (car list), (insertR new, old, (cdr list)))
  end
end

def multiinsertR(new, old, list)
  case
  when (null? list) then []
  when (eq? (car list), old) then (cons old, (cons new, (multiinsertR new, old, (cdr list))))
  else (cons (car list), (multiinsertR new, old, (cdr list)))
  end
end

def insertL(new, old, list)
  case
  when (null? list) then []
  when (eq? (car list), old) then (cons new, (cons old, (cdr list)))
  else (cons (car list), (insertL new, old, (cdr list)))
  end
end

def multiinsertL(new, old, list)
  case
  when (null? list) then []
  when (eq? (car list), old) then (cons new, (cons old, (multiinsertL new, old, (cdr list))))
  else (cons (car list), (multiinsertL new, old, (cdr list)))
  end
end

def subst(new, old, list)
  case
  when (null? list) then []
  when (eq? (car list), old) then (cons new, (cdr list))
  else (cons (car list), (subst new, old, (cdr list)))
  end
end

def subst2(new, old1, old2, list)
  case
  when (null? list) then []
  when ((eq? (car list), old1) or (eq? (car list), old2)) then (cons new, (cdr list))
  else (cons (car list), (subst2 new, old1, old2, (cdr list)))
  end
end
