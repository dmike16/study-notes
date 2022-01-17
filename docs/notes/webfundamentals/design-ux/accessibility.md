## Accessibility

Accessibility mean that a site's content is available, and its functionalities can be operated, by anyone.
Accessibility refers tipically to the expirience of users that migth interact with things differently from the 
ones of "typical" user.
https://www.w3.org/TR/WCAG20/[Web Content Accessibility Guidelines] is a set of guidelines about accessibiity.
It's built on frour concept _POUR_

* *Perceivable*: Can user perceive the content?
* *Operable*: Can user interact with UI components?
* *Understandable*: Can user understand the UI and its content?
* *Robust*: Can the content be consumed by a wide range of User Agent?

The guidelines of WCAG are summarized into http://webaim.org/standards/wcag/checklist[WebAIM checklist] that can give 
a short list of what you need to implement.

### Focus

The focus determines where keyboard inputs go on the page. The WebAIM checklist states that all page 
functionalities should be available using the keyboard, unless it's somthing that cannot be done with the keyboard.
By default all element like text, input ,select checkbox and radio are all focusable, div paragraph ecc.. are not.

### DOM Order Matters

The focus follow the dom's elements order. But sometimes the visual position of the elements are not the one
in the dom due to css properties (like _flaot_). For this reason the WebAIM checklist states that the reading and 
the navigation order, as determinated by the code order, should be logical and intuitive.

It's possible to have element that are not show on the page (like a side nav-bar) that still recive focus, to eliminate this effect
we should set _display: none_ or _visibility: hidden_ when the element is not showed.

### Using Tab Index

Sometimes the default order is not what we want e change the elemente order into the code is not
always the best solution. We can that advantage of the _tabindex_ html tag. This tag can take a range of
integer values: 
 
* *tabindex='0'* insert an element inside the natural tab order, so it can be focused unsing tab or the `focus()` method.
* *tabindex='-1'* remove element from the natural tab order, by facus can be set using `focus()` method.
* *tabindex='5'* with a positive integer put the element at top of tab order, this is *anti-pattern*.

::: tip
Tab index can be used to manage focus at page livel, for example when new content is display onto the page with set *tabindex='-1'*
and call `focus()` method on the section (_Managing Focus_).
:::

When we are creating custom component and would replicate keyboard behavoir we should refet to https://www.w3.org/TR/wai-aria-practices/[ARIA] guide

::: tip
To support keyboard up/down/left/right arrow key we can use a techinc called _roving tabindex_. It consists in setting *tabinder='-1'* except 
for the currently-active one and listen to keyboard event to determine which key is pressed. When that happen we set the pervius one to *tabinder='-1'*
and the focued one to *tabinder='0'* and call focus method on it. When the last is reached we loop around.
:::

Sometimes when managing focus we can create a so called _keyboard trap_  that prevet the user form move focus on another component. But in some situations
this behavoir is desirable, like when opening a modal window. When don't wanto that the focus exape this modal. We can creat a _keyboard trap_ in this way:
 
1. Using `querySelector` to select the modal e modal-overlay div ref
2. As the modal open store a ref of the `activeElement` to restore focues on modal close.
3. Use _keydown_ listener to grab key as their are pressed.
4. Get collection of _focusable_ elements on the modal. The fist and the last will act as sentinels
5. Display the modal window and set the focus on the first element.
6. As user press Tab or Tab+Shift moveing loop around the elements.
7. IF the user press ESC close the modal 
8. On close restore the focues to the saved element.






