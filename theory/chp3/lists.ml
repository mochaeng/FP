let rec from i j l = 
  if i > j then l else from i (j - 1) (j :: l)

let create_big_list i j = from i j []

let rec sum_helper acc = function
  | [] -> acc
  | h :: t -> sum_helper (acc + h) t

let sum_tr lst = sum_helper 0 lst

