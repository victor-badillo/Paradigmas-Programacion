let rec divide l = match l with
    h1::h2::t -> let t1, t2 = divide t in (h1::t1, h2::t2)
   | _ -> l, [];;
   
   
   
let rec merge = function
    [], l | l, [] -> l
   | h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, h2::t2)
                       else h2 :: merge (h1::t1, t2);;
                       
                       
let rec msort1 l = match l with
    [] | _::[] -> l
   | _ -> let l1, l2 = divide l in
          merge (msort1 l1, msort1 l2);;


(*La no terminalidad de divide o merge puede causar Stack overflow con listas muy grandes*)

let l2  = List.init 500000 (function x -> Random.int 1000);;


let divide' l =
    let rec aux l1 e1 e2 = 
      match l1 with
        h1::h2::t -> aux t (h1::e1) (h2::e2)
       | _ -> (List.rev_append e1 l1, List.rev e2)
    in aux l [] [];;
    
    
let merge' f l =
    let rec aux l1 e =
        match l1 with
        [], l | l, [] -> List.rev_append e l
       | h1::t1, h2::t2 -> if f h1 h2 then aux (t1,h2::t2) (h1::e)
                           else aux (h1::t1,t2) (h2::e)
    in aux l [];;
    
    
let rec msort2 f l =
    match l with
    [] | _::[] -> l
   | _ -> let l1,l2 = divide' l
          in merge' f (msort2 f l1, msort2 f l2);;
    
(*Lista a ordenar es l*)
(*let l = List.init 10000 (function x -> Random.int 1000)*)    
(*Para msort2 el tiempo obtenido es: 0.0157890000000007191
  Para msort1 el tiempo obtenido es: 0.0112980000000000302
  Para qsort2 el tiempo obtenido es: 0.0126429999999997378
*)
    
(*Los tiempos son muy similares para los 3, siendo msort1 el mas rápido*)
    
    
    
    
