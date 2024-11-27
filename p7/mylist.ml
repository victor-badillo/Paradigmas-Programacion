let hd l=
    match l with
   | x::_ -> x
   | [] -> raise (Failure "doesn't exist");;
   
   
let tl l =
   match l with 
   | _::x -> x
   | [] -> raise (Failure "doesn't exist");;
   

let rec length l =
   match l with
  | [] -> 0
  | _::t -> 1 + length t;;


let rec compare_lengths l1 l2 = 
  match l1,l2 with
  | [],[] -> 0
  | [], _ -> -1
  | _, [] -> 1
  | _::t1, _::t2 -> compare_lengths t1 t2;;

let rec nth l x = 
   match l,x with
   | [],_ -> raise (Failure "nth")
   | h::_,0 -> h
   | _::t,_ -> nth t (x-1);;


let rec append l1 l2 =
   match l1 with
   | [] -> l2
   | h::t -> h::(append t l2);;
   
   
let rec rev l =
   match l with
   | [] -> []
   | h::t -> append (rev t) [h];;   
   
   
let rec find f l =
   match l with
   | [] -> raise(Failure "Not found")
   | h::t -> match f h with
   		| true -> h
   		| false -> find f t;;
   		
let rec for_all f = function
   | [] -> true
   | h::t -> f h  &&  for_all f t;;
   		
   		
let rec exists f l=
   match l with
   | [] -> false
   | h::t ->  (f h) || exists f t;; 

   		
let rec mem n l =
   match l with 
   | [] -> false
   | h::t -> match h=n with
   		| true -> true
   		| false -> mem n t;;
   	    (*if (h=n) then true else mem n t*)

let rec filter f l =
   match l with
   | [] -> []
   | h::t -> match f h with
   		| true -> h::(filter f t)
   		| false -> filter f t;;

  
let find_all = filter;;
   
 
let rec partition f l =
   match l with
   | [] -> ([],[])
   | h::t -> let (e1,e2) = partition f t
   	     in if(f h) then (h::e1,e2) else (e1,h::e2);; 		


let rec split l =
   match l with
   | [] -> ([],[])
   | (h1,h2)::t -> let (e1,e2) = split t
   		   in (h1::e1,h2::e2);;
   
let rec combine l1 l2 =
   match l1,l2 with
   | [],[] -> []
   | [],_ -> raise (Invalid_argument "Please try to input some data that fulfill the condition")
   | _,[] -> raise (Invalid_argument "Please try to input some data that fulfill the condition")
   | h1::t1,h2::t2 -> (h1,h2) :: (combine t1 t2);;
   	
let init len f = 
     if len < 0 then raise (Invalid_argument "init")
     else let rec aux l i = 
           if i=len then rev l
           else aux (f i ::l) (i+1)
           in aux [] 0;;
   

let rev_append l1 l2 =
   if(l1 = []) then l2
   else append(rev l1) l2;;
  
    
let rec concat l =
   match l with
   | [] -> []
   | h::t -> append h (concat t);;
   

let flatten=concat;;
   
   
let rec map f l =
   match l with
   | [] -> []
   | h::t -> (f h)::(map f t);;
   
   
let rev_map f l =
   match l with
   | [] -> []
   | _ ->  rev(map f l);;
   
   
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
   
   
   
   


   
   		
   		
