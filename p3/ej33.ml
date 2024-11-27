(*let g n = (n >= 0 && n mod 2 = 0) || n mod 2 = -1;;*)
let g1 n = if(if(n>=0)then n mod 2=0 else false) then true else (if(n mod 2 = -1) then true else false);;


let g2 n=
  (function true -> (function true -> true | false -> false)(n mod 2=0) | false-> (function true-> true | false -> false)(n mod 2= -1))(n>=0);;
