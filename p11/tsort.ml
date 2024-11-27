open Bin_tree;;

let insert_tree ord x t =
  let rec insert_tree_aux = function
    | Empty -> Node (x, Empty, Empty)
    | Node (y, l, r) ->
        if ord x y = true then
          Node (y, insert_tree_aux l, r)
        else
          Node (y, l, insert_tree_aux r)
  in
  insert_tree_aux t
;;


let tsort ord l =
  inorder (List.fold_left (fun a x -> insert_tree ord x a) Empty l)
;;
