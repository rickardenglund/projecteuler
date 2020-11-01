open System.Numerics

let len n = 1 + (int (BigInteger.Log10 n))

let stoplength = 1000

let rec find i a b = 
    if len(b) >= stoplength 
    then i 
    else find (i + 1) b (a + b)

let stopwatch = System.Diagnostics.Stopwatch.StartNew()
printf "first with fiba number with length %d has index %A\n" stoplength (find 2 1I 1I)
stopwatch.Stop()
printf "time: %fms\n" stopwatch.Elapsed.TotalMilliseconds
