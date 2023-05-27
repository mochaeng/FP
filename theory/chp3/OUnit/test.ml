open OUnit2
open Sum

let make_sum_test name expected_value input =
  name >:: (fun _ -> assert_equal expected_value (sum input) ~printer:string_of_int) 

let tests = "test suit for sum" >::: [
    make_sum_test "empty" 0 [];
    make_sum_test "one element" 1 [1];
    make_sum_test "two element" 3 [1;2];
  ]

let _ = run_test_tt_main tests
