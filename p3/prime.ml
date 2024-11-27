let is_prime n =
  let rec check_from i =
    i >= n ||
    (n mod i <> 0 && check_from (i+1))
  in check_from 2;;

let rec next_prime n=
     if is_prime(n+1) then n+1 else next_prime n+1;;
     
let rec last_prime_to n=
    if is_prime(n) then n else last_prime_to n-1;;
    
let rec is_prime2 n=
    let rec check_from i =
        (float_of_int i) >= (sqrt (float_of_int n))||
        (n mod i <> 0 && check_from (i+1))
    in check_from 2;;
    
(*is_prime 1_000_000_007 ha tardado 9 segundos y medio, en cambio is_prime2 1_000_000_007 ha calculado el resultado lo que para nosotros sería tan solo un instante*)
