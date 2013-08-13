Code Exercise for Cyrus
=======================

- By: Mendel Kramer
- Ruby v. 1.9.3p429 (2013-05-15 revision 40747) [x86_64-darwin12.3.0]
- Rake v. 10.1.0
- RSpec v. 2.14.3

Usage
-----

To use this app, type this command into your terminal:

```
ruby PATH/TO/app.rb PATH/TO/file_1 delimiter_1 PATH/TO/file_n delimiter_n
```

Delimiters can be a '|' (pipe), ',' (comma) or ' ' (space).

The different outputs will appear in the terminal.

Complete Example
----------------

This example uses the three example files.

```
ruby app.rb lib/examples/pipe.txt '|' lib/examples/comma.txt ',' lib/examples/space.txt ' '
```