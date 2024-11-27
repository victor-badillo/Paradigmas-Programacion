let f n= if n mod 2 =0 then n/2 else 3*n +1;;

let rec orbit n=
  (string_of_int n) ^ 
  if n =1 then ""
  else ", " ^ orbit(f(n));;
  
let rec length n=
   if n=1 then 0
   else 1+ length(f(n));;
   
let rec top n=
   if n=1 then 1 else max n (top(f n));;
   
   
let rec length'n'top n=
   if n=1 then (0,1)
   else let p,q = length'n'top (f n)
    in (p+1, max n q);;

let longest_in m n=
   let rec aux (imax,lmax) i=
       if i > n then (imax,lmax)
       else let l= length i in
          if l > lmax then aux(i,l) (i+1)
          else aux(imax,lmax) (i+1)   
          in aux(m,length m) (m+1);;		
          
let highest_in m n =
    let rec aux (imax, lmax) i =
       if i > n then (imax, lmax)
       else let l = top i in
          if l > lmax then aux(i,l) (i+1)
          else aux (imax,lmax) (i+1)
          in aux(m,length m) (m+1);;																																																																																																																																																																																																																																																																																																																	
      
