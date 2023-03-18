let x = 
  match not true with 
  | true -> "nope"
  | false -> "yep"

let y = 
  match 42 with
  | fooo -> fooo

let z =
  match "foo" with
  | "bar" -> 0
  | _ -> 1

let a = function
  | [] -> "empty"
  | _ -> "there is something"

let c =
  match ["son"; "chaeyoung"] with
  | [] -> "brave"
  | h :: t -> h


let fst3 = function
  | (a, b, c) -> a

let is_empty = function
  | [] -> true
  | _ -> false

let rec sum = function
  | [] -> 0
  | h :: t -> h + sum t

let rec length = function
  | [] -> 0
  | _ :: t -> 1 + length t

let rec append lst1 lst2 =
  match lst1 with 
  | [] -> lst2
  | h :: t -> h :: append t lst2
