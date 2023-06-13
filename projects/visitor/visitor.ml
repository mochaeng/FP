type operator = Plus | Minus

type literal = NUMBER of int | STRING of string

type expr =
  | Binary of expr * operator * expr
  | Literal of literal
  | Unary of operator * expr

let rec print_expr = function
  | Binary (left, token, right) 
    -> "(" ^ print_expr left ^ print_token token ^ print_expr right ^ ")"
  | Literal value -> print_literal value
  | Unary (token, right) 
    -> print_token token ^ print_expr right

and print_token = function
  | Plus -> "+"
  | Minus -> "-"

and print_literal = function
  | NUMBER num -> string_of_int num
  | STRING str -> str

let expr0 =
  Binary
    ( Unary (Minus, Literal (NUMBER 4)),
      Plus,
      Literal (NUMBER 1)
    )

let expr1 = 
  Unary (Minus, Literal (STRING "not"))

let () = print_endline (print_expr expr0)
let () = print_endline (print_expr expr1)