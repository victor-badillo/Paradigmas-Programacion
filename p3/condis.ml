false && (2 / 0 > 0);;
(*false*)

(*true && (2 / 0 > 0)*);;
(*Exception: Division_by_zero, es un error de ejecución*)

true || (2 / 0 > 0);;
(*true*)

(*false || (2 / 0 > 0)*);;
(*Exception: Division_by_zero*)

let con b1 b2 = b1 && b2;;
(*val con : bool->bool->bool = <fun>*)

let dis b1 b2 = b1 || b2;;
(*val dis : bool -> bool -> bool = <fun>*)

(*con (1 < 0) (2 / 0 > 0);;*)
(*Exception: Division_by_zero*)

(1 < 0) && (2 / 0 > 0);;
(*false*)

(*dis (1 > 0) (2 / 0 > 0);;*)
(*Error unbound value dis*)

(1 > 0) || (2 / 0 > 0);;
(*true*)
