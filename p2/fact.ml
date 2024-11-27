let rec fact = function
    0 -> 1
    | n -> n * fact (n- 1)
 in if Array.length Sys.argv <> 2 then print_endline ("fact: número de argumentos inválido")
    else print_endline(string_of_int(fact(int_of_string(Array.get Sys.argv(1))))) (*1 para escoger el numero, el segundo elemento del array*)
