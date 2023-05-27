## Functions

## Tail Recursion

[Read More](https://cs3110.github.io/textbook/chapters/basics/functions.html#tail-recursion)

```ml
let rec count n =
    if n = then 0 else 1 + count (n - 1)
```

If you try to count up to 1,000,000 you'll get a Stack overflow error.

- **The Call Stack**: That stack contains one element for each function
  call thtat has not yet finished.

- **Tail Recursion**: A solution to this issue.

The core of the problem is that after the recursive call `count (n - 1)`, there is computation remaining: 1 still need to be add to that result.

The trick is to create a helper function with extra parameter.

```ml
let rec count_aux n acc =
    if n = 0 then acc else count_aux (n - 1) (acc + 1)

let count_tr n = count_aux n 0
```

Now the "reamining computation" happens before the recursive call.

The compiler can notice when a recursive call is in _tail position_. A recursive call doesn not need a new stack frame. It can just reuse the existing stack frame.

1. Change the function into a helper one. Add an extra argument, the accumulator.
2. Write a main version of the function that calls the helper. It passes the value with the initial value of the accumulator.
3. Make the helper function returns the accumulator.
4. The recursive case in the helper function now needs to do the extra work.
