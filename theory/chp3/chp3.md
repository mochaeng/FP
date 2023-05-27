# Data and Types

## Lists

```ml
[]  (* empty *)
1 :: 2 :: []  (* [1;2] *)
[1;2]  (* [1;2] *)
```

- Append:

```ml
[1;2] @ [3;4]  (* [1;2;3;4] *)
```

- Deep pattern matching:
  <br />

  `_ :: []` Matches all lists with exaclty one element
  `_ :: _` Matches all lists with at least one element
  `_ :: _ :: []` Matches all lists with exactly two elements
  `_ :: _ :: _ :: _` Matches all lists with at least three elements

- You could alse create a big list with help of the id function:

```ml
List.init 1_000_000 Fun.id  (* [f 0; f 1; ...]; f (len - 1) *)
```

## Variants

A _variant_ is a data type representing a value that is one of several possibilities.

```ml
type day = Sun | Mon | Tue | Fri
let today = Fri
```

The individual names of the values of a variant are called _constructors_.

## Unit Tests with OUnit

- Creat a list of test cases

```ml
let tests = "test suite for sum" >:::
    [
        "empty" >:: (fun _ -> assert_equal 0 (sum [])) ~printer:string_of_int;
        "one_element" >:: (fun _ -> assert_equal 1 (sum [1]));
        "two_element" >:: (fun _ -> assert_equal 3 (sum [1;2]));
    ]

let _ = run_test_tt_main tests
```

Each line represents a test. A test has a string giving it a descriptive name and a function to run.

`>::` is just a custom operator defined by the OUnit framework

`~printer:string_of_int;` prints the actual value

## Records and Tuples

_Record_ is a composite of other types of data, each of which is named.

## Type synonysm

```ml
type point = float * float
```

Anywhere that a tuple `float * float` appears, we could use `point`.

## Options

```ml
type 'a option = None | Some of 'a
```

Like in rust.

Options forces you to include a branch for `None` and `Some`. Thus avoid the `null pointer exception` problem.

## Association Lists

Implementation of a map.

But is actually just a list of pairs.

```ml
let d = [("momo", 23); ("dahyun", 25)]
```

## Algebraic Data Types

### Variants that Carry Data

```ml
type shape =
  | Point of point
  | Circle of point * float
  | Rect of point * point
```
