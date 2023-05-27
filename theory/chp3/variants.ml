type primary_color = Red | Green | Blue

let r = Red

type point = float * float
type shape =
  | Circle of { center : point ; radius : float}
  | Rectangle of { lower_left : point; upper_right : point }
  | Point of point

let c1 = Circle { center = (0.0, 0.0); radius = 1.0}
let c2 = Circle { center = (1.1, 1.1); radius = 4.0}
let r1 = Rectangle { lower_left = (-1., -1.); upper_right = (1., 1.)}
let p1 = Point (31., 10.)

let avg x y = (x +. y) /. 2.

let center s =
  match s with
  | Circle {center} -> center
  | Rectangle {
      lower_left = (x_ll, y_ll); 
      upper_right = (x_up, y_up)
    } -> (avg x_ll x_up, avg y_ll y_up )
  | Point p -> p


(* either a blue or a pink integer *)
type blue_pink = Blue of int | Pink of int

let x = Blue 1
let y = Pink 1

let multiply bp = 
  match bp with
  | Blue b -> b * 1
  | Pink p -> p * 2