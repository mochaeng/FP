type student = {
  name : string;
  year : int;
}

let person1 = { name = "Ruth Bader"; year = 1954;}
let person2 = { person1 with name = "Ranger" }


type ptype = Normal | Fire | Water
type pokemon = {
  name : string;
  hp : int;
  ptype : ptype
}

let char = {name = "Charmander"; ptype = Fire; hp = 30}

let to_string poke =
  match poke with
  | {name; hp} -> name ^ " " ^ string_of_int hp


(* ----------------------------------  *)

type member = {
  name  : string;
  surname : string;
}

let m = {name = "Momo"; surname = "Hirai"}

let print_name member = 
  match member with
  | {name; } -> "The name is " ^ name

let print_name' member = "The name is " ^ member.name