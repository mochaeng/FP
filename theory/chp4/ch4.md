# High order Functions

Functions are just values!

```ml
let double = 2 * x
let quad = x |> double |> double

(* ('a -> 'a) -> 'a -> 'a = <fun> *)
let twice f x = f (f x)

let quad'  x  = twice double x
let quad'' x  = twice quad x

(* 'a -> 'a *)
let quad'''   = twice double
```

The **Pipeline** operator is also a higher-order function:

```ml
let pipeline x f = f x
let ( |> ) = pipeline
let x = 5 |> pipeline
```

