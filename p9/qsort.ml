let rec qsort1 ord = function
     [] -> []
     | h::t -> let after, before = List.partition (ord h) t in
               qsort1 ord before @ h :: qsort1 ord after;;


(*
En los casos en los que la lista ya esté ordenada de forma ascendente o descendentemente ya que todos los elementos de la lista menos uno irían al before o after en cada iteración
*)


let rec qsort2 ord =
      let append' l1 l2 = List.rev_append (List.rev l1) l2 in
      function
          [] -> []
        | h::t -> let after, before = List.partition (ord h) t in
                  append' (qsort2 ord before) (h :: qsort2 ord after);;


(*
Con qsort2 es más rápida ya que en el caso de que la lista ya esté ordenada es más rapida que qsort1 y además usa funciones del módulo list que son terminales. Gracias a esto se pueden ordenar listas más grandes
*)

let init r f =
  let rec aux (i, l) =
    if i = r
      then l
    else aux(i + 1, f i::l)
  in List.rev(aux(0, []));;

let l1 = init 300000 (function x -> Random.int 5000);;


(*
Para listas inicializadas inversamente o aleatoriamente qsort1 es más rápido que qsort2
Para este caso qsort2 es 95,32% más lento que qsort1
*)
