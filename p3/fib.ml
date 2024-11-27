(*let rec fib n =
if n <= 1 then n
else fib (n-1) + fib (n-2)*)

let rec fib n = 
    if n <= 1 then n 
    else fib(n-1) + fib(n-2);;

(*Imprime uno*)
let print_fib n =
 print_endline (string_of_int(fib n));;
 
 let rec print_fibs n=
   if n<0 then ()
   else let _= print_fibs (n-1) in print_fib n;;
   
if Array.length Sys.argv=2
then print_fibs (int_of_string (Sys.argv.(1)))
else print_endline "El numero de parámetros no es el correcto";;
