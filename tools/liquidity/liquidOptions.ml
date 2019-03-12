(**************************************************************************)
(*                                                                        *)
(*    Copyright (c) 2017 - OCamlPro SAS                                   *)
(*                                                                        *)
(*    All rights reserved. No warranty, explicit or implicit, provided.   *)
(*                                                                        *)
(**************************************************************************)

(** {2 Options of the Liquidity compiler } *)

(** Verbosity level *)
let verbosity =
  ref
    (try int_of_string (Sys.getenv "LIQUID_VERBOSITY")
     with
     | Not_found -> 0
     | _ -> 1 (* LIQUID_DEBUG not a number *)
    )

(** Perform inlining *)
let inline = ref true

(** Perform simplifications *)
let simplify = ref true

(** Do peephole optimiztions *)
let peephole = ref true

(** Stop after typing *)
let typeonly = ref false

(** Stop after parsing *)
let parseonly = ref false

(** Produce Michelson on a single line (no indentation) *)
let singleline = ref false

(** Produce outputs of the compiler in Json format. This can be used
    to construct RPCs manually outside the Tezos client and Liquidity
    client *)
let json = ref false

(** Ignore Michelson type annotations ([%c] and [:t]) when decompiling *)
let ignore_annots = ref false

(** Don't produce any annotations when compiling *)
let no_annot = ref false

(** Name of main contract when compiling *)
let main = ref (None : string option)

(** Path/name of ouptut file for compiling/decompiling *)
let output = ref (None : string option)


(** {2 Options of the Liquidity tezos client } *)

(** Address of the node with the RPC port *)
let tezos_node = ref "127.0.0.1:8732"

(** Source (optional) of the transaction, a tz.. or a KT1... *)
let source = ref (None : string option)

(** Amount in tez for the transaction or origination *)
let amount = ref "0"

(** Fee (default 0.05 tz) in microtez *)
let fee = ref "50000"

(** Originate a delegatable contract *)
let delegatable = ref false

(** Originate a spendable contract *)
let spendable = ref false

(** Gas limit for transactions and originations. The default value is
    the maximum allowed by Tezos at the moment. *)
let gas_limit = ref "5000000"

(** The storage limit for transactions and originations. The default
    value is the maximum allowed by Tezos at the moment. *)
let storage_limit = ref "60000"

(** Private key can be given to the liquidity tezos-client when
    injecting signed transactions and originations directly. *)
let private_key = ref (None : string option)

let signature = ref (None : string option)
let counter = ref (None : int option)

type proto =
  | Zeronet
  | Mainnet
  | Alphanet

let protocol = ref (None : proto option)

let main_id = "NetXdQprcVkpaWU"
let zeronet_id = "NetXSzLHKwSumh7"

let ocaml_syntax = ref true
