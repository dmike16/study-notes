## Element

It's a costituent part of a block that can not be used outside of it.

* The element name describes it's purpose not it's state
* The element name should be of the form `block-name__element-name`
* Elements can be nested inside each other.
* A element it's always part of a block.
``` html
<!--
    Correct. The structure of the full element name follows the pattern:
    `block-name__element-name`
-->
<form class="search-form">
    <div class="search-form__content">
        <input class="search-form__input">

        <button class="search-form__button">Search</button>
    </div>
</form>
```
* The elements can be nested in a block but the block structure is always
rappresented as a flat list of element
``` html
<div class="block__elem1">
    <div class="block__elem2">
        <div class="block__elem3"></div>
    </div>
</div>
</div>

.block {}
.block__elem1 {}
.block__elem2 {}
.block__elem3 {}
```
