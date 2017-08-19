== Mix
:sectanchors:

A technique for using different BEM entites on a single DOM node.

* Lets us combine behavoir and style of different component
* Lets us create new UI components based on existing one.

[source,xml]
----
<!-- `header` block -->
<div class="header">
    <!--
        The `search-form` block is mixed with the `search-form` element
        from the `header` block
    -->
    <div class="search-form header__search-form"></div>
</div>
----
