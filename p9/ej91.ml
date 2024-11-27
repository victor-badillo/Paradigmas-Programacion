

let to0from n =
    let rec aux n e =
        if n < 0 then List.rev e
        else aux (n-1) (n::e)
    in aux n [];;


let rec fromto m n =
    let rec aux m n e =
        if m > n then List.rev e
        else aux (m+1) n (m::e)
    in aux m n [];;
    


let incseg l =
    let rec aux l n e =
    match l with
     [] -> List.rev e
    | h::t -> aux t (n+h) ((n+h)::e)
    in aux l 0 [];;

    
let remove x l = 
    let rec aux x l e = 
        match l with
        [] -> List.rev e
       | h::t -> if h=x then List.append (List.rev e) t
                 else aux x t (h::e)
    in aux x l [];;    
    
    
    
let compress l =
    let rec aux l e =
        match l with
        | h1::h2::t -> if h1 = h2 then aux (h2::t) e
                       else aux (h2::t) (h1::e)

        | h::[] -> List.rev (h::e)
        | [] -> [] (*A este caso solo se llega si la lista es vacia*)
    in aux l [];;
                
            
    
    
    
