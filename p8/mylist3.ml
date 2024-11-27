let remove x l = 
    let rec aux x l e = 
        match l with
        [] -> List.rev e
       | h::t -> if h=x then List.append (List.rev e) t
                 else aux x t (h::e)
    in aux x l [];;
  
let remove_all x l =
    let rec aux x l e =
        match l with
        [] -> List.rev e
       | h::t -> if h=x then aux x t e
                 else aux x t (h::e)
    in aux x l [];;
    


let rec ldif l1 = function
     [] -> l1
    | h::t -> ldif (remove_all h l1) t;;
    

let lprod l1 l2 =    
    List.flatten(List.map (fun x ->  List.map (fun y -> (x,y)) l2) l1 );;
    

let rec divide = function
       h1::h2::t -> let t1, t2 = divide t in
                          h1::t1, h2::t2
      | l -> l , [];;


 
    
    
    
    
    
    
