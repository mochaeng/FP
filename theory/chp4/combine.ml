let rec sum = function
  | [] -> 0
  | h :: t -> h + sum t

let rec concat = function
  | [] -> ""
  | h :: t -> h ^ concat t

let rec combine base op = function
  | [] -> base
  | h :: t -> op h (combine base op t)

let rec fold_right f lst acc = 
  match lst with
  | [] -> acc 
  | h :: t -> f h (fold_right f t acc) 

let rec fold_left f acc lst = 
  match lst with 
  | [] -> acc
  | h :: t -> fold_left f (f acc h) t

let sum' lst = combine 0 ( + ) lst
let concat' lst = combine "" ( ^ ) lst