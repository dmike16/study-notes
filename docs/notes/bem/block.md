## Block

A functionally indipendent page component, that encapsulates behavoir(JavaScript),
template, style(CSS) and other possible technologies. Easily reusable.
In CSS are rappresented by *class* attribute.

* The block name describes its purpose not its state.
* The block should not influence the container,
that is should not set external geometry or positioning so it  can be placed everywhere in the page.

* The block can be nested
* T,hhe block can be re-used many times in the page.

``` html
<!-- Correct. The `error` block is semantically meaningful -->
<div class="error"></div>

<!-- Incorrect. It describes the appearance -->
<div class="red-text"></div>

```
