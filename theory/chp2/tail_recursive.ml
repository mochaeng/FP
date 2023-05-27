let rec fac_aux n acc =
  if n = 0 then acc else fac_aux (n - 1) (n * acc)

let fac n = fac_aux n 1