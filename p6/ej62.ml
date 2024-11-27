let curry f x y = f(x,y);;

let uncurry f (x,y) = f x y;;

uncurry (+);;
(*- : int * int -> int = <fun>*)

let sum = (uncurry (+));;
(*val sum : int * int -> int = <fun>*)

(*sum 1;;
No es una dupla
Type Error: expression of type int * int was expected but the expression is type int*)

sum (2,1);;
(*(- : int = 3)*)

let g = curry (function p -> 2 * fst p + 3 * snd p);;
(*val g : int -> int -> int = <fun>*)

(*g (2,5);;
Type Error: expression of type int was expected but the expression is type 'a * 'b*)

let h = g 2;;
(*val h : int -> int = <fun>*)

h 1, h 2, h 3;;
(*- : int * int * int = (7, 10, 13)*)


(*comp : (’a -> ’b) -> (’c -> ’a) -> (’c -> ’b) *)
let comp f g x = f (g x);;

let f = let square x = x * x in comp square ((+) 1);;
(*- : int * int * int) = (4, 9, 16) *)


let i a = a;;
(* 'a -> 'a *)


let j (a,b)= a;;
(* 'a * 'b -> 'a *)


let k (a,b)= b;;
(* 'a * 'b -> 'b *)


let l a = a :: [];; 
(* 'a -> 'a list *)

(*Para f, h, e i hay solo una solución, En cambio para j hay infinitas soluciones ya que lo que devuelve es una lista que puede ser de cualquier tamaño*)




