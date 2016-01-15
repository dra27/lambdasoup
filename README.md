# Lambda Soup

Lambda Soup is a functional HTML scraping and manipulation library for OCaml
aimed at being easy to use.

![Lambda Soup usage example][sample]

[sample]: https://raw.githubusercontent.com/aantron/lambda-soup/master/docs/sample.gif

[![version 0.5.1][version]][releases] [![BSD license][license-img]][license]

[version]:     https://img.shields.io/badge/version-0.5.1-blue.svg
[license-img]: https://img.shields.io/badge/license-BSD-blue.svg

For some more examples, see the Lambda Soup [postprocessor][postprocess] that
runs on Lambda Soup's own [documentation][docs] after it is generated by
`ocamldoc`.

Lambda Soup is *simple*. It provides a set of
[elementary traversals][traversals] for getting from node to node, familiar
functional [combinators][combinators] such as `filter`, `map`, and `fold`, and
support for all CSS selectors that still make sense when not running in a
browser (and a few obvious [extensions][extracss] on top of that).

The library is [tested][tests] thoroughly.

## Installing

Simply

    opam install lambdasoup

If you want to install a development version, see instructions in
[CONTRIBUTING][contributing-install].

[contributing-install]: https://github.com/aantron/lambda-soup/blob/master/docs/CONTRIBUTING.md#developing

## Starting from scratch

To use Lambda Soup interactively as in the GIF at the top of this README, you
need to do the following, if you are starting from scratch:

```sh
your-package-manager install ocaml opam
opam init
eval `opam config env`          # Or restart your shell
opam install lambdasoup
```

and make sure your `~/.ocamlinit` file looks something like this:

```ocaml
let () =
  try Topdirs.dir_directory (Sys.getenv "OCAML_TOPLEVEL_PATH")
  with Not_found -> ()
;;

#use "topfind";;
```

Then, run `ocaml -short-paths` to start the top-level, and scrape away!

## Documentation

Lambda Soup's interface consists of one module, whose signature is documented
[here][docs].

## Performance

I ran a simplistic performance test, comparing some
[Lambda Soup code][ocaml-perf] to the equivalent
[Beautiful Soup code][python-perf] operating on the Google search page. The
Lambda Soup code was compiled to both native code and bytecode. Here are the
results on my system:

    test            native      bytecode    python

    parse            272 µs     1167 µs     4173 µs
    traverse           4 µs       44 µs       53 µs
    select            13 µs      167 µs      105 µs
    select_all        26 µs      338 µs      164 µs

It seems that the initial, naive implementation of `select` could use some work.
However, absent feedback, this does not have a very high priority. It is
certainly fast enough for interactive use, for example.

## Developing

See [CONTRIBUTING][contributing]. All feedback is welcome – open an issue on
GitHub, or send me an email at [antonbachin@yahoo.com][email]. If you find
yourself repeatedly writing the same helper on top of Lambda Soup's functions,
perhaps we should add it to Lambda Soup.

[![Travis status][travis-img]][travis]

[travis]:       https://travis-ci.org/aantron/lambda-soup/branches
[travis-img]:   https://img.shields.io/travis/aantron/lambda-soup/master.svg

## License

Lambda Soup is distributed under the BSD license. See [LICENSE][license].

Lambda Soup includes a modified version of [Ocamlnet][ocamlnet]'s Nethtml HTML
parser. The license for this parser is also found in the [LICENSE][license]
file.

[docs]:         http://aantron.github.io/lambda-soup
[postprocess]:  https://github.com/aantron/lambda-soup/blob/master/docs/postprocess.ml
[tests]:        https://github.com/aantron/lambda-soup/blob/master/test/test.ml
[ocaml-perf]:   https://github.com/aantron/lambda-soup/blob/master/test/performance.ml
[python-perf]:  https://github.com/aantron/lambda-soup/blob/master/test/performance.py
[contributing]: https://github.com/aantron/lambda-soup/blob/master/docs/CONTRIBUTING.md
[email]:        mailto:antonbachin@yahoo.com
[license]:      https://github.com/aantron/lambda-soup/blob/master/docs/LICENSE
[releases]:     https://github.com/aantron/lambda-soup/releases
[extracss]:     http://aantron.github.io/lambda-soup#VALselect
[traversals]:   http://aantron.github.io/lambda-soup#2_Elementarytraversals
[combinators]:  http://aantron.github.io/lambda-soup#2_Combinators
[ocamlnet]:     http://projects.camlcity.org/projects/ocamlnet.html
