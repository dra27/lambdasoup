let version =
  Scanf.sscanf Sys.ocaml_version "%u.%u." (fun maj min -> maj, min)
in
if version < (4, 03) then
  print_string {|
module String =
struct
  include String
  let lowercase_ascii = lowercase [@ocaml.warning "-3"]
end

module Char =
struct
  include Char

  let lowercase_ascii = lowercase [@ocaml.warning "-3"]
end
|}
