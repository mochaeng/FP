let rec evens = function
  | [] -> []
  | h :: t -> begin
    if h mod 2 = 0 then h :: evens t
    else evens t
  end

let rec odds = function
  | [] -> []
  | h :: t -> begin
    if h mod 2 = 1 then h :: odds t
    else odds t
  end

let rec filter p = function
  | [] -> []
  | h :: t -> if p h then h :: filter p t else filter p t

let odds' x = 
  x mod 2 = 1 
let evens' x = 
  x mod 2 = 0


let rec filter_aux p acc = function
  | [] -> List.rev acc
  | h :: t -> filter_aux p (if p h then h :: acc else acc) t
    (* if p h then 
      let a = h :: acc
      in filter_aux p a t
    else filter_aux p acc t *)

let filter_tl p lst = filter_aux p [] lst
