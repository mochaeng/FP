let double x = 2*x
let square x = x*x
let twice f x = f (f x)
let quad = twice double
let fourth = twice square

(* square $ 2 + 2 => square 4 => 16 vs square 2 + 2 => 6
  It Allows to separete the function from an expression without 
  using parenthesis *)
let ( $ ) f x = f x 


(* String.length @ string_of_int : x |> String.length |> string_of_int   
    1, 10, 10  === 1, 2, 3 *)
let ( @@ ) f g x = x |> g |> f


(* repeat N times *)
let rec repeat f n x = 
  if n = 0 then x else repeat f (n-1) (f x)


(* product *)
let product_left lst = List.fold_left ( *. ) 1.0 lst
let product_right lst = List.fold_right ( *. ) lst 1.0


(* sum of odds cube *)
let rec ( -- ) i j = if i <= j then i :: i+1 -- j else []
let is_odd x = x mod 2 = 1
let cube x = x * x * x 

let sum_cube_odd n =
  let lst = 0 -- n 
  in List.fold_left ( + ) 0 (List.map cube  (List.filter is_odd lst))

let sum_cube_odd' n =
  0 -- n 
  |> List.filter is_odd 
  |> List.map cube 
  |> List.fold_left ( + ) 0


(* Exists *)
let rec exists_rec f = function
  | [] -> false
  | h :: t -> f h || exists_rec f t

let exists_fold f lst = 
  List.fold_left (fun acc elem -> acc || f elem) false lst

let lst = [1;2;3;4;5]
let lsto = [0;2;4;6;8;10]