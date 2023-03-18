# Expression

# Sintax

# Semantics
    - Type-checking (static semantic)
    - Evaluation rules (dynamic semantics)

# If and Else
    - if e1 then e2 else e3

# Evaluation (IF): 
    - if e1 ==> true and e2 ==> v,
    then (if e1 then e2 else e3) ==> v
    - if e1 ==> false and e3 =>> v,
    then (if e1 then e2 else e3) ==> v

# Type-checking(IF):
    - if e1 : bool and e2 : t and e3 : t
    then (if e1 then e2 else e3) : t

# Let: Gives a name to a value. They syntactilly contain expressions
    - syntax: let x = e (x is identifier)

# Evaluation:
    - Evaluates e to v
    - Bind v to x

# Scope
    - The scope of a variable is where its name is meaningful

    - 
    let x = 1;;         let x = 1 in
    let x = 2;;             let x = 2 in 
    x;;                         x;;

# Anonymous function expression
    - Syntax: fun x1 ... xn -> e
    - Sugar: let inc x = x + 1 <==>  let inc = fun x -> x + 1
    - Example:
        let f x y = x - y;;
        f 3 2;;
        -------
        let f x y = x - y in
            f 3 2;;

        let f = fun x y -> x - y in
            f 3 2;;

        (fun x y -> x - y) 3 2;;
        3 - 2;;
        1

# Recursive (FUN)
    - let rec f ...

# Evaluation (FUN)
    - A function is a value!

# Type-checking (FUN)  
    
