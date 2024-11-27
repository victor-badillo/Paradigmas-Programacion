
open G_tree;;

let rec breadth_first = function
    Gt (x, []) -> [x]
  | Gt (x, (Gt (y, t2))::t1) -> x :: breadth_first (Gt (y, t1@t2));;

let breadth_first_t gt = 
  let rec aux acc = function
  | Gt (x, []) -> x :: acc
  | Gt (x, (Gt (y, t2))::t1) -> aux (x :: acc) (Gt (y, t1 @ t2))
in List.rev (aux [] gt);;


let t2 =
  let rec build_tree n =
    if n = 0 then Gt (n, [])
    else Gt (n, [build_tree (n - 1)])
  in build_tree 150_000;;
