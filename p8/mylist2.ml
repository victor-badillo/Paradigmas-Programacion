let hd = function
     x::_ -> x
   | [] -> raise (Failure "hd");;
   
   
let tl = function
     _::x -> x
   | [] -> raise (Failure "tl");;


let length l = 
    let rec aux l x =
     match l with
      [] -> x
    | _::t -> aux t (x+1)
    in aux l 0;;



let rec compare_lengths l1 l2 = 
  match l1,l2 with
    [],[] -> 0
  | [], _ -> -1
  | _, [] -> 1
  | _::t1, _::t2 -> compare_lengths t1 t2;;
  
  
let nth l x = 
  if x < 0 then raise (Invalid_argument "nth")
  else   
       let rec nthaux l x = 
   	 match l,x with
   	   [],_ -> raise (Failure "nth")
   	 | h::_,0 -> h
   	 | _::t,_ -> nthaux t (x-1) 
       in  nthaux l x;;  


let rec append l1 l2 =
   match l1 with
   | [] -> l2
   | h::t -> h::(append t l2);;
   
   
let rev l =
    let rec aux l e = match l with
         [] -> e
        | h::t -> aux t (h::e)
    in aux l [];;   
   
   
let rec find f = function
     [] -> raise(Failure "Not found")
   | h::t -> if f h then h
             else find f t;;

   		
let rec for_all f = function
     [] -> true
   | h::t -> f h  &&  for_all f t;;
   		
   		
let rec exists f = function
     [] -> false
   | h::t ->  (f h) || exists f t;; 

   		
let rec mem n = function
     [] -> false
   | h::t -> if (h=n) then true 
   	     else mem n t;;


let filter f l =
    let rec aux f l e =
         match l with 
          [] -> rev e
        | h::t -> if f h then aux f t (h::e)
       		  else aux f t e
     in aux f l [];;


  
let find_all = filter;;
   
 
let rec partition f = function
     [] -> ([],[])
   | h::t -> let (e1,e2) = partition f t
   	     in if(f h) then (h::e1,e2) else (e1,h::e2);; 		


let rec split = function
     [] -> ([],[])
   | (h1,h2)::t -> let (e1,e2) = split t
   		   in (h1::e1,h2::e2);;
   
let rec combine l1 l2 =
   match l1,l2 with
     [],[] -> []
   | [],_ -> raise (Invalid_argument "combine")
   | _,[] -> raise (Invalid_argument "combine")
   | h1::t1,h2::t2 -> (h1,h2) :: (combine t1 t2);;
   	
let init len f = 
     if len < 0 then raise (Invalid_argument "init")
     else let rec aux l i = 
             if i=len then rev l
             else aux (f i ::l) (i+1)
           in aux [] 0;;


let rev_append l1 l2 =
   if l1 = [] then l2
   else if l2 = [] then rev l1
   else let rec aux l1 = function
            [] ->  rev l1
          | h::t -> aux (h::l1) t
        in aux l1 l2;;
    
let rec concat = function
     [] -> []
   | h::t -> append h (concat t);;
   

let flatten=concat;;
   
   
let rec map f = function
     [] -> []
   | h::t -> (f h)::(map f t);;


let rev_map f l = 
    let rec aux f l e =
          match l with
           [] -> e
          | h::t -> aux f t (f h ::e)
    in aux f l [];;      
   
   
let rec map2 f l1 l2 =
   if(length l1 != length l2) then raise (Invalid_argument "Please try again")
   else if (length l1 ==0) then []
   else (f(hd l1)(hd l2))::map2 f (tl l1)(tl l2);;


let rec fold_left f a l =
   match l with
   | [] -> a
   | h::t -> fold_left f (f a h) t;;
   
   
let rec fold_right f l a =
   match l with
   | [] -> a
   | h::t -> f h (fold_right f t a);;
  
