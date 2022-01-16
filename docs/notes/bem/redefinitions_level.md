## Redefinition Level

Implementation of block are based on *redefinition levels*.
Some exmaples are:

### Linking a Library

A library can be linked to a project as a separate level and blocks can be modified
at another level. In the build project the original block implementation will be
linked from the library level and from the project level.

```
library.blocks/
    button/
        button.css    # CSS implementation in the linked library (height 20px)
project.blocks/
    button/
        button.css    # Redefinition of CSS implementation (height 24px)
```

### Diving a project into platform

Different platforms rappresent different redefinitions levels. The start point is
a `common` level that conatins block's implementation common to all platform.
The `desktop` and `mobile` levels contain platfom-specific block implementation.

```
common.blocks/
    button/
        button.css    # Generic CSS implementation of the button
desktop.blocks/
    button/
        button.css    # Desktop platform-specific button features
mobile.blocks/
    button/
        button.css    # Mobile platform-specific button features
```

During the build process all the generics rules are included in `desktop.css`
from `common` level and `desktop` level.

``` css
@import(common.blocks/button/button.css);    /* Generic CSS rules */
@import(desktop.blocks/button/button.css);   /* Desktop platform-specific */
```

The `mobile.css` file will include the generic css rules form `common` level and `mobile` level.

``` css
@import(common.blocks/button/button.css);    /* Generic CSS rules */
@import(mobile.blocks/button/button.css);    /* Mobile platform-specific */
```
