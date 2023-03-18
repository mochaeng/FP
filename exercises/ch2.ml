(* You can check the type inside utop *)
let _ = 7 * (1 + 2 + 3)
let _ = "CS" ^ string_of_int 3110

(* The ( ** ) only works for floats, not integers 
   Simple exp at the end *)
let _ : int = ( * ) 42 10
let _ : float = ( /. ) 3.14 2.0
let _ = 4.2 ** 7.
let rec exp x n = 
    if n = 1 then x else x * exp x (n-1)

(* equality *)
let _ : bool = 42 = 42 
let _ : bool = "hi" = "hi"  (* Structural equality *)
let _ : bool = "hi" == "hi" (* Physical equality *)

(* assert *)
let _ : unit = assert true
let _ = assert (not (2110 = 3110))
let _ = assert (2110 <> 3110)

(* if *)
let _ = if 42 > 2 then 1 else 7

(* double fun *)
let double x = x * 2

(* more fun *)
let cube x = x *. x *. x
let sign x = 
    if x = 0 then 0
    else
        if x > 1 then 1
        else -1
let area radius = Float.pi *. radius ** 2.
let ( =. ) a b = Float.abs (a -. b) < 1e-5
let _ = assert (Float.pi =. area 1.)

(* RMS *)
let root x y = (((x ** 2.) +. (y ** 2.)) /. 2.) ** (1. /. 2.)

(* data fun *)
let checkData d m = 
    if m = "Fev" then d >= 1 && d <= 28
    else
        if m = "Jan" || m = "Mar" || m = "May" || m = "Jul" || m = "Sep" || m = "Nov" 
            then d >= 0 && d <= 31
        else if m = "Fev" || m = "Apr" || m = "Jun" || m = "Ago" || m = "Out" || m = "Dec"
            then d >= 0 && d <= 31
        else false

(* fib  *)
let rec fib n = 
    if n = 0 then 0
    else if n <= 2 then 1
    else fib (n - 1) + fib (n - 2)

(* fib fast 
   A Overflow happens at fib_fast 110 *)
let rec helper n pp p = 
    if n = 1 then p
    else helper (n - 1) p (pp + p)
let fib2 n = helper n 0 1
let fib_fast n =
    if n = 0 then 0
    else fib2 n
let f x = if x then x else x (* bool -> bool *)
let g x y = if y then x else x (* 'a -> bool -> 'a *)
let h x y z = if x then y else z (* bool -> 'a -> 'a -> 'a *)
let i x y z = if x then y else y (* bool -> 'a -> 'b -> 'a *)


(* divide *)
let divide ~numerator:x ~denominator:y = x /. y
let _ = divide ~denominator:2.0 ~numerator:4.0


(* associativity  *)
(* int -> int -> int *)
let add x y = x + y
let _ = add 5 1 (* integer *)
let _ = add 5   (* function: int -> int *)
let _ = (add 5) 1 (* integer *)
(* let _ = add (5 1) (* error! *)  *)


(* average *)
let ( +/. ) x y = (x +. y) /. 2.
let _ = assert (1. +/. 2. = 1.5)


(* hello world *)
(* print_string "Hello World";; *)
