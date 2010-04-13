def lat?(list)
  case
  when (null? list) then true
  when (atom? (car list)) then (lat? (cdr list))
  else false
  end
end

def member?(atom, list)
  case
  when (null? list) then false
  else ((eq? (car list), atom) or (member? atom, (cdr list)))
  end
end
