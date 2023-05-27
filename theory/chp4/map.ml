let rec add1 = function
  | [] -> []
  | h :: t -> (h + 1) :: add1 t

let rec concat_chae = function
  | [] -> []
  | h :: t -> (h ^ "Chaeyoung") :: concat_chae t

let rec transform f = function
  | [] -> []
  | h :: t -> f h :: transform f t

let add1' lst = transform (fun x -> x + 1) lst
let concat_chae' lst = transform (fun x -> x ^ "Chaeyoung") lst
let stringlist_of_intlist lst = transform string_of_int lst