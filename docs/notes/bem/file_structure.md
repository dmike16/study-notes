== File Structure
:sectanchors:

The BEM methodology also applies to the project file structure. Not only the
implementation it's divided in indipendent block but the implementation of
different block it's divided into indipendent files. Before the code is sent
to the broswer this blocks are assembled and optiomized. That way we separte the
human-readable code form the one that is sent to the broswer.

.Codebase
* A block implementation is divied into separates files
* A block is made of a set of files that is determined by the technologies used (input.css,input.js)
* Optional elements and modifiers are stored in separate files
* Only the files that are essential to the block implementation are included in the build
* Files are grouped by meaning not by type
* Block files can be grouped  into a block directory
* A project is divided into redefinition level
* The final implementation of a block can be split into redefinition levels.

=== Example of file structure

.Nested
* For every block there is a directory
* The directory is named after the block
* A block implementation is divided into separate files
* The files all have the same name as the block
* The ext of each files corresponde to its technology
* Names of files and directories for [[BEM Entity]] are based on naming convention
** Element -- `block__elem.ext`
** Block Modifier -- `block_mod_val.ext` or `block_mod.ext`
** Element Modifier -- `block__element_mod_val.ext` or `block__element_mod.ext`
* Modifiers and element are stored in separat files and are grouped into accordingly named subdirectories
* If there are modifiers that differ in value, the shared code can be stored in a common file with no modifier value.

[source]
----
blocks/
    input/
        _type/                                 # type modifier directory
            input_type_search.css              # Implementation of modifier type
                                               # with value search in CSS technology
        __box/                                 # box element directory
            input__box.css
        __clear/                               # clear element directory
            _visible/                          # visible modifier directory
                input__clear_visible.css       # Implementation of boolean modifier visible
                                               # with value true in CSS technology
            _size/                             # size modifier directory
                input__clear_size_large.css    # Implementation of modifier size
                                               # with value large in CSS technology
            input__clear.css
            input__clear.js
        input.css
        input.js
    button/
        button.css
        button.js
        button.png
----

.Flat
* Blocks don't have the own directory
* Optional element and modifiers are in separate files

[source]
----
blocks/
    input_type_search.js
    input_type_search.bemhtml.js
    input__box.bemhtml.js
    input.css
    input.js
    input.bemhtml.js
    button.css
    button.js
    button.bemhtml.js
    button.png
----

.Flex
* One block per directory
* Elements and modifiers are implemented in separete files
+
[source]
----
blocks/
    input/
        input_layout_horiz.css
        input_layout_vertical.css
        input__elem.css
        input.css
        input.js
    button/
----
+
* One block per directory
* Elements and modifiers are implmented in block files
+
[source]
----
blocks/
    input/
        input.css
        input.js
    button/
----
+
* Blocks don't have their block directories
* Elements and modifiers are implemented in block files
+
[source]
----
blocks/
    input.css
    input.js
    button.css
    button.js
----
+
* Blocks don't have their own directories
* Elements and modifiers are implemented in separte files
+
[source]
----
blocks/
    input_type_search.js
    input_type_search.bemhtml.js
    input__box.bemhtml.js
    input.css
    input.js
    input.bemhtml.js
    button.css
    button.js
    button.bemhtml.js
    button.png
----
