# 2 "stdlib/sys.mlp"
(***********************************************************************)
(*                                                                     *)
(*                                OCaml                                *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the GNU Library General Public License, with    *)
(*  the special exception on linking described in file ../LICENSE.     *)
(*                                                                     *)
(***********************************************************************)

(* WARNING: sys.ml is generated from sys.mlp.  DO NOT EDIT sys.ml or
   your changes will be lost.
*)

(* System interface *)

external get_config: unit -> string * int * bool = "caml_sys_get_config"
external get_argv: unit -> string * string array = "caml_sys_get_argv"
external big_endian : unit -> bool = "%big_endian"
external word_size : unit -> int = "%word_size"
external unix : unit -> bool = "%ostype_unix"
external win32 : unit -> bool = "%ostype_win32"
external cygwin : unit -> bool = "%ostype_cygwin"

let (executable_name, argv) = get_argv()
let (os_type, _, _) = get_config()
let big_endian = big_endian ()
let word_size = word_size ()
let unix = unix ()
let win32 = win32 ()
let cygwin = cygwin ()
let max_array_length = (1 lsl (word_size - 10)) - 1;;
let max_string_length = word_size / 8 * max_array_length - 1;;

external file_exists: string -> bool = "caml_sys_file_exists"
external is_directory : string -> bool = "caml_sys_is_directory"
external remove: string -> unit = "caml_sys_remove"
external rename : string -> string -> unit = "caml_sys_rename"
external getenv: string -> string = "caml_sys_getenv"
external command: string -> int = "caml_sys_system_command"
external time: unit -> float = "caml_sys_time"
external chdir: string -> unit = "caml_sys_chdir"
external getcwd: unit -> string = "caml_sys_getcwd"
external readdir : string -> string array = "caml_sys_read_directory"

let interactive = ref false

type signal_behavior =
    Signal_default
  | Signal_ignore
  | Signal_handle of (int -> unit)

external signal : int -> signal_behavior -> signal_behavior
                = "caml_install_signal_handler"

let set_signal sig_num sig_beh = ignore(signal sig_num sig_beh)

let sigabrt = -1
let sigalrm = -2
let sigfpe = -3
let sighup = -4
let sigill = -5
let sigint = -6
let sigkill = -7
let sigpipe = -8
let sigquit = -9
let sigsegv = -10
let sigterm = -11
let sigusr1 = -12
let sigusr2 = -13
let sigchld = -14
let sigcont = -15
let sigstop = -16
let sigtstp = -17
let sigttin = -18
let sigttou = -19
let sigvtalrm = -20
let sigprof = -21

exception Break

let catch_break on =
  if on then
    set_signal sigint (Signal_handle(fun _ -> raise Break))
  else
    set_signal sigint Signal_default


(* The version string is found in file ../VERSION *)

let ocaml_version = "4.02.1+ocp1";;

let system cmdline =
  command (
    (* Under Windows, system argument is sent to 'cmd' without the quotes,
       so we need to add them before !*)
    if win32 then "\"" ^ cmdline ^ "\"" else cmdline)
