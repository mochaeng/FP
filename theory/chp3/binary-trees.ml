(* ------------------ using variants ---------------------- *)

type 'a tree =
    | Leaf 
    | Node of 'a * 'a tree * 'a tree

let rec size tree =
    match tree with
    | Leaf -> 0
    | Node (_, left, right) -> 1 + size left + size right

let my_tree = Node (
    1,
    Node(
        2,
        Node(4, Leaf, Leaf),
        Node(8,
            Node (6, Leaf, Leaf), 
            Leaf
        )
    ),
    Node(
        3,
        Leaf,
        Leaf
    )
)

(* ------------------ using recordds ---------------------- *)

(*                        1                                 *)
(*                       / \                                *)
(*                      2   3                               *)
(*                     / \                                  *)
(*                    4   8                                 *)
(*                         \                                *)
(*                          6                               *)


type 'a tree = Leaf | Node of 'a node
and 'a node = { value : 'a ; left : 'a tree; right : 'a tree }

let constructor ~root = Node root

let rec r_size r_tree =
    match r_tree with
    | Leaf -> 0
    | Node node -> 1 + r_size node.left + r_size node.right

(* quadratic time *)
let rec preorder = function
    | Leaf -> []
    | Node node -> [node.value] @ preorder node.left @ preorder node.right

(* linear time *)
let preorder_lin tree = 
    let rec precc acc tree = 
        match tree with
        | Leaf -> acc
        | Node {value; left; right} -> value :: precc( precc acc right ) left 
    in precc [] tree

let rec find tree ~value_to_find:v = 
    match tree with
    | Leaf -> false
    | Node {value; left; right} -> 
        v = value || find left ~value_to_find: v || find right ~value_to_find: v

let rec depth tree = 
    match tree with
    | Leaf -> 0
    | Node {value; left; right} -> 1 + max (depth left) (depth right)

let r4 = { value = 4; left = Leaf; right = Leaf }
let r6 = { value = 6; left = Leaf; right = Leaf }
let r8 = { value = 8; left = Node r6; right = Leaf }
let r2 = { value = 2; left = Node r4; right = Node r8 }
let r3 = { value = 3; left = Leaf; right = Leaf }
let r1 = { value = 1; left = Node r2; right = Node r3 }

let my_r_tree = constructor ~root: r1

