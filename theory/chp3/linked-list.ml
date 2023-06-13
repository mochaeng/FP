type 'a linker = 
    | Nil
    | New of 'a * 'a linker

let rec print_linker_aux acc linker = 
    let str = match linker with
    | Nil -> acc
    | New (value, tail) -> print_linker_aux (acc ^ " " ^ string_of_int value) tail
    in String.trim str

let rec length_linker_aux acc linker =
    match linker with
    | Nil -> acc
    | New (value, tail) -> length_linker_aux (acc + 1) tail

let length_linker_tail_recursive linker = length_linker_aux 0 linker

let print_linker_tail_recursive linker =
    let rec print_linker_aux acc linker =
        match linker with
        | Nil -> acc
        | New (value, tail) -> print_linker_aux (acc ^ " " ^ string_of_int value) tail
    in print_linker_aux "" linker

let my_linker = New (1, New ( 2, New ( 3, New (4, New (10, Nil)))))

(* ------------------------------------- *)

type 'a mylist = Nil | Node of 'a node
and 'a node = { value : 'a ; next : 'a mylist}

let node2 = { value = 4; next = Nil }
let node1 = { value = 1; next = Node node2 }
let node0 = { value = 9; next = Node node1 }

let list0 = Node node0

let rec sum_my_list my_lst = 
    match my_lst with
    | Nil -> 0
    | Node node -> node.value + sum_my_list node.next


