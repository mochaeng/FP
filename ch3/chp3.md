# Lists
    - Immutable: cannnot change elements 
    - Singly-linked

# Sintax
    - [] empty list
    - e1 :: e2
    - [e1; e2] sintax sugar for: e1 :: e2 :: []
    
    - [] is pronounced "nil"
    - :: is pronounced "cons" (construct)
    - both come from lisp

    - t list describes a list of type t

# Evaluation (LISTS)
    - [] is a value
    - e1 :: e2
        - evaluates e1 to v1
        - evaluates e2 to v2 (has to a be a list)
        - return v1 :: v2

# Type-cheking (LISTS)
    - []: 'a list
    - cons (e1 :: e2): 
        - if e2 has type (t list), then e1 must have
        type t
        - then (e1 :: e2) : (t list)

# Data Types:
    - lists: unbounded size
    - records: bounded by name
    - tuples: bounded by position

# Variants:
    + Syntax:
        type v = f1 | f.. | fn

# Records:
    + Syntax: 
        - {f1 = e1; f2 = e2}
        - e.f access field f of e
        - f must be a identifier
        - order do not matters

    + Dynamic semantics:
        - if ei => vi then {f1=e1;..;fn=en} ==> {f1=v1;...;fn=vn}
        - if e ==> {..;f = v;..} then e.f = v
    + Static semantics:
        - 

# Tuples:
    + Syntax:
        - (e1,e2, e3)
        - order matters
    + Evaluation:
        - if e1 => vi then (e1,..,en) => (v1,..,vn)
    + Type-cheking:
        - if ei : ti then (e1,..,en) => t1 * .. * tn

# Pattern Matching:
    - Immediately matching against the final element can be ommited
    with a 'function' keyword

    + Syntax:
        - if e ==> v then (match e ...) ==> vi
    + Type-cheking:
        - if e and pi have type t1 and ei have type t2
        then entire expression has type t2

