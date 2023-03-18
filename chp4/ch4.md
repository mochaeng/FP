# High order Functions
  > Functions are just values

  ```ml
  let double = 2 * x
  let quad = x |> double |> double

  (* ('a -> 'a) -> 'a -> 'a *)
  let twice f x = f (f x)

  let quad'  x  = twice double x
  let quad'' x  = twice quad x

  (* 'a -> 'a *)
  let quad'''   = twice double
  ```

## Map
  > Applying a function to every element of a list and give the
  > a new list

  > ('a -> 'b) -> 'a list -> 'b list


## Fold
  ```ml
  List.fold_right f [a;b;c] init
  ```
  > f a (f b (f c (init)))

  > Acumulates ans answer by
    - Repeatedly applying f to an element of list and "answer so
    far"
    - Folding in list elements "from right"

## Filter