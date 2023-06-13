(* list expressiongs *)
let _ = [1; 2; 3; 4; 5]
let _ = 1 :: 2 :: 3 :: 4 :: 5 :: []
let _ = [1] @ [2; 3; 4] @ [5]


(* product *)
let prod lst = 
    let rec aux acc lst = 
        match lst with 
        | [] -> acc
        | h :: t -> aux (acc * h) t
    in aux 1 lst


(* concat *)
let rec conc = function
    | [] -> ""
    | h :: t -> h ^ (conc t)


(* patterns *)
let has_big_red = function
    | [] -> false
    | h :: _ -> begin
        match h with
            | "bigred" -> true
            | _ -> false
    end

let has_two_or_four = function 
    | [_;_] -> true
    | [_;_;_;_] -> true 
    | _ -> false

let two_are_equal = function
    | first :: second :: _ -> first = second
    | _ -> false  (* empty or 1 element *)


(* library *)
let fifth lis =
    let size = List.length lis in
    if size <= 5 then 0 
    else List.nth lis 5

let desc_sort lis = 
    lis |> List.sort Stdlib.compare |> List.rev 


(* library puzzle *)
let last_element lis = 
    let len = List.length lis in
    List.nth lis (len - 1)

let any_zeroes lista =
    let pred a = a = 0 in
    List.exists pred lista


(* take and drop *)

let rec take' n lst = 
    if n = 0 then []
    else match lst with
        | [] -> []
        | h :: t -> h :: take' (n-1) t

let rec drop' n lst =
    if n = 0 then lst 
    else match lst with
        | [] -> []
        | h :: t -> drop' (n-1) t

let rec take_reverse n lst acc =
    if n = 0 then acc
    else match lst with 
        | [] -> []
        | h :: t -> take_reverse (n-1) t (h :: t)

let take_tr n lst = 
    take_reverse n lst [] |> List.rev


(* unimodal *)
let get_max lst = 
    let rec finder lst_ n = 
        match lst_ with 
            | [] -> n
            | h :: t -> begin
                if h > n then finder t h
                else finder t n
            end
    in finder lst (List.hd lst)


(* prints *)
let rec print_int_list = function
    | [] -> ()
    | h :: t -> begin
        print_int h;
        print_endline "";
        print_int_list t
    end

let print_int_list' lst = 
    List.iter (fun x -> 
        print_int x; 
        print_endline "";) lst

(* student *)
type student = {
    first_name : string;
    last_name : string;
    gpa : float
}

let momo = {first_name="Momo"; last_name = "Hira"; gpa=20.1}
let get_name std = (std.first_name, std.last_name)
let create_student first_name last_name gpa = 
    {first_name; last_name; gpa}


(* pokerecord *)
type poketype = Normal | Fire | Water
type pokemon = {name : string; hp : int; ptype : poketype}
let ch = {name = "Charizard"; hp = 78; ptype = Fire}
let sq = {name = "Squirtle"; hp = 44; ptype = Water}


(* safe hd tl *)
let safe_hd = function
    | [] -> None
    | h :: _ -> Some h

let safe_tl = function
    | [] -> None
    | _ :: t -> Some t


(* pokefun *)
let rec max_hp pokes = 
    match pokes with
    | [] -> None
    | h :: t -> begin
        match max_hp t with 
        | None -> Some h
        | Some s -> Some(if h.hp >= s.hp then h else s)
    end


type date = (int * int * int)


(* date before *)
let date_before (date1 : date) (date2 : date) = 
    let (year1, month1, day1) = date1 in
    let (year2, month2, day2) = date2 in
    year1 < year2 || (year1 = year2 && month1 < month2) || 
    (year1 = year2 && month1 = month2 && day1 < day2)


type quad = I | II | III | IV
type sign = Neg | Zero | Pos

let sign (x : int) : sign =
    if x = 0 then Zero
    else if x < 0 then Neg
    else Pos

let quadrant : int*int -> quad option = fun (x, y) -> 
    match sign(x), sign(y) with
    | Pos, Pos -> Some I
    | Neg, Pos -> Some II
    | Neg, Neg -> Some III
    | Pos, Neg -> Some IV
    | _ -> None
    
let quadrant_when : int*int -> quad option = function
    | a, b when a > 0 && b > 0 -> Some I
    | a, b when a < 0 && b > 0 -> Some II
    | a, b when a < 0 && b < 0 -> Some III
    | a, b when a > 0 && b < 0 -> Some IV
    | _ -> None

let rec max_safe lst =
    match lst with 
    | [] -> None
    | h :: t -> begin
        match max_safe t with
        | None -> Some h
        | Some s -> Some (if h > s then h else s)
    end

let max_exn lst = 
    match lst with
    | [] -> failwith "Empty"
    | _ -> max_safe lst


(* depth *)
type 'a tree =
    | Leaf 
    | Node of 'a * 'a tree * 'a tree

