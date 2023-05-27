let d = [("rectangle", 4); ("nonagon", 9)]

let insert key value map = (key, value) :: map

let rec mylookup key map = 
  match map with
  | [] -> None
  | h :: t -> begin
      match h with
      | (k, v) -> if key = k then Some v else mylookup key t 
    end

let rec lookup key map = 
  match map with
  | [] -> None
  | (k, v) :: t -> if key = k then Some v else lookup key t