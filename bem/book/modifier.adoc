== Modifier
:sectanchors:

Defines the appareance,state of a <<block>> or <<element>>.

.Modifier Features
* The name defines its state or its appearence
* The modifer name is separed from block or element by (`_`)

.Boolean
* Used only where the presence or absence of the modifier is important
* The structure name is
** `block-name_modifier`
** `block-name__element-name_modifier`
+
[source,xml]
----
<!-- The `search-form` block has the `focused` Boolean modifier -->
<form class="search-form search-form_focused">
    <input class="search-form__input">

    <!-- The `button` element has the `disabled` Boolean modifier -->
    <button class="search-form__button search-form__button_disabled">Search</button>
</form>
----

.Key-Value
* Used when the modifier value is important
* The structure name is:
** `block-name_modifier-name_modifier-value`
** `block-name__element-name_modifier-name_modifier-value`
+
[source,xml]
----
<!-- The `search-form` block has the `theme` modifier with the value `islands` -->
<form class="search-form search-form_theme_islands">
    <input class="search-form__input">

    <!-- The `button` element has the `size` modifier with the value `m` -->
    <button class="search-form__button search-form__button_size_m">Search</button>
</form>

<!-- You can't use two identical modifiers with different values simultaneously -->
<form class="search-form
             search-form_theme_islands
             search-form_theme_lite">

    <input class="search-form__input">

    <button class="search-form__button
                   search-form__button_size_s
                   search-form__button_size_m">
        Search
    </button>
</form>
----
