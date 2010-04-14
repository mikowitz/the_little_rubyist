def add1(number)
  number + 1
end

def sub1(number)
  number - 1
end

def zero?(number)
  number == 0
end

def plus(number1, number2)
  case
  when (zero? number2) then number1
  else (add1 (plus number1, (sub1 number2))) 
  end
end

def minus(number1, number2)
  case
  when (zero? number2) then number1
  else (sub1 (minus number1, (sub1 number2)))
  end
end

def times(number1, number2)
  case
  when (zero? number2) then 0
  else (plus number1, (times(number1, (sub1 number2))))
  end
end

def addtup(tup)
  case
  when (null? tup) then 0
  else (plus (car tup), (addtup (cdr tup)))
  end
end
