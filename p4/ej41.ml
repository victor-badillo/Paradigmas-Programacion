let rec sum_cifras n=
   if n=0 then 0 else n mod 10 + sum_cifras(truncate(float_of_int(n)/.10.));;

let rec num_cifras n=
   if (abs(n)<10) then 1 else 1+num_cifras(n/10);;

let rec exp10 n=
   if(n=0) then 1 else 10* exp10(n-1);;

let rec reverse n=
   if(n<10) then n else (n mod 10)*exp10(num_cifras(n)-1)+ reverse(truncate(float_of_int(n)/.10.));;

(*let rec palindromo s=
   if(String.length s <= 1) then true
   else (
        s.[0] = s.[String.length s -1] && palindromo(String.sub s 1 (String.length s -2)) );;*)
        
let palindromo s =
    let rec check_from i j =
    i>=j || (s.[i]=s.[j] && check_from (i+1)(j-1))
     in check_from 0 (String.length s-1);;
