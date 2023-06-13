type natural = Zero | Succ of natural

let is_zero nan =
    match nan with
    | Zero -> true
    | Succ _ -> false

let predecessor nan =
    match nan with
    | Zero -> failwith "Zero doesn't have a predecessor"
    | Succ num -> num
    
let rec add nan1 nan2 = 
    match nan1 with
    | Zero -> nan2
    | Succ pre_nan1 -> add pre_nan1 (Succ nan2)

let rec int_of_natural nan =
    match nan with
    | Zero -> 0
    | Succ pre_nan -> 1 + int_of_natural pre_nan

let rec natural_of_int num =
    match num with
    | num when num = 0 -> Zero
    | num when num > 0 -> Succ (natural_of_int (num - 1))
    | _ -> failwith "undefined for negatives"

let zero = Zero
let one = Succ zero
let two = Succ one
let three = Succ two
let four = Succ three 
let five = Succ four


