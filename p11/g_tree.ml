
type 'a g_tree =
  Gt of 'a * 'a g_tree list
;;

let rec size = function 
    Gt (_, []) -> 1
  | Gt (r, h::t) -> size h + size (Gt (r, t))
;;


let rec height tree =
  match tree with
  | Gt(_, children) -> 1 + (List.fold_left max 0 (List.map height children))

    
let rec leaves = function 
    Gt (r,[]) -> [r]
  | Gt (r,l) -> List.flatten (List.map leaves l);;
    
let rec mirror = function 
  Gt (r,l) -> Gt(r, List.map mirror (List.rev l));;
  
  
let rec preorder = function 
    Gt (r,[]) -> [r] 
  | Gt (r,l) -> r::List.flatten (List.map preorder l);;
  
  
let rec postorder = function 
    Gt (r,[]) -> [r]
  | Gt (r,l) -> List.flatten (List.map postorder l) @ [r];;

