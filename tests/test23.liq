
type storage = int

let%entry default
    (parameter : address)
    storage =

  let r, ops = match%nat (storage + 1)  with
    | Plus x -> x + 2p, []
    | Minus y ->
      let op = Contract.call parameter ~entry:default 0tz y in
      0p, [op]
  in
  let x = r + 10p in
  let storage = abs storage in
  (if x > 10p then ops else ops), storage
