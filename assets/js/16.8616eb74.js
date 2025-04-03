(window.webpackJsonp=window.webpackJsonp||[]).push([[16],{421:function(t,s,e){"use strict";e.r(s);var n=e(56),a=Object(n.a)({},(function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("ContentSlotsDistributor",{attrs:{"slot-key":t.$parent.slotKey}},[e("h2",{attrs:{id:"redefinition-level"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#redefinition-level"}},[t._v("#")]),t._v(" Redefinition Level")]),t._v(" "),e("p",[t._v("Implementation of block are based on "),e("em",[t._v("redefinition levels")]),t._v(".\nSome exmaples are:")]),t._v(" "),e("h3",{attrs:{id:"linking-a-library"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#linking-a-library"}},[t._v("#")]),t._v(" Linking a Library")]),t._v(" "),e("p",[t._v("A library can be linked to a project as a separate level and blocks can be modified\nat another level. In the build project the original block implementation will be\nlinked from the library level and from the project level.")]),t._v(" "),e("div",{staticClass:"language- line-numbers-mode"},[e("pre",{pre:!0,attrs:{class:"language-text"}},[e("code",[t._v("library.blocks/\n    button/\n        button.css    # CSS implementation in the linked library (height 20px)\nproject.blocks/\n    button/\n        button.css    # Redefinition of CSS implementation (height 24px)\n")])]),t._v(" "),e("div",{staticClass:"line-numbers-wrapper"},[e("span",{staticClass:"line-number"},[t._v("1")]),e("br"),e("span",{staticClass:"line-number"},[t._v("2")]),e("br"),e("span",{staticClass:"line-number"},[t._v("3")]),e("br"),e("span",{staticClass:"line-number"},[t._v("4")]),e("br"),e("span",{staticClass:"line-number"},[t._v("5")]),e("br"),e("span",{staticClass:"line-number"},[t._v("6")]),e("br")])]),e("h3",{attrs:{id:"diving-a-project-into-platform"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#diving-a-project-into-platform"}},[t._v("#")]),t._v(" Diving a project into platform")]),t._v(" "),e("p",[t._v("Different platforms rappresent different redefinitions levels. The start point is\na "),e("code",[t._v("common")]),t._v(" level that conatins block's implementation common to all platform.\nThe "),e("code",[t._v("desktop")]),t._v(" and "),e("code",[t._v("mobile")]),t._v(" levels contain platfom-specific block implementation.")]),t._v(" "),e("div",{staticClass:"language- line-numbers-mode"},[e("pre",{pre:!0,attrs:{class:"language-text"}},[e("code",[t._v("common.blocks/\n    button/\n        button.css    # Generic CSS implementation of the button\ndesktop.blocks/\n    button/\n        button.css    # Desktop platform-specific button features\nmobile.blocks/\n    button/\n        button.css    # Mobile platform-specific button features\n")])]),t._v(" "),e("div",{staticClass:"line-numbers-wrapper"},[e("span",{staticClass:"line-number"},[t._v("1")]),e("br"),e("span",{staticClass:"line-number"},[t._v("2")]),e("br"),e("span",{staticClass:"line-number"},[t._v("3")]),e("br"),e("span",{staticClass:"line-number"},[t._v("4")]),e("br"),e("span",{staticClass:"line-number"},[t._v("5")]),e("br"),e("span",{staticClass:"line-number"},[t._v("6")]),e("br"),e("span",{staticClass:"line-number"},[t._v("7")]),e("br"),e("span",{staticClass:"line-number"},[t._v("8")]),e("br"),e("span",{staticClass:"line-number"},[t._v("9")]),e("br")])]),e("p",[t._v("During the build process all the generics rules are included in "),e("code",[t._v("desktop.css")]),t._v("\nfrom "),e("code",[t._v("common")]),t._v(" level and "),e("code",[t._v("desktop")]),t._v(" level.")]),t._v(" "),e("div",{staticClass:"language-css line-numbers-mode"},[e("pre",{pre:!0,attrs:{class:"language-css"}},[e("code",[e("span",{pre:!0,attrs:{class:"token atrule"}},[e("span",{pre:!0,attrs:{class:"token rule"}},[t._v("@import")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),t._v("common.blocks/button/button.css"),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")])]),t._v("    "),e("span",{pre:!0,attrs:{class:"token comment"}},[t._v("/* Generic CSS rules */")]),t._v("\n"),e("span",{pre:!0,attrs:{class:"token atrule"}},[e("span",{pre:!0,attrs:{class:"token rule"}},[t._v("@import")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),t._v("desktop.blocks/button/button.css"),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")])]),t._v("   "),e("span",{pre:!0,attrs:{class:"token comment"}},[t._v("/* Desktop platform-specific */")]),t._v("\n")])]),t._v(" "),e("div",{staticClass:"line-numbers-wrapper"},[e("span",{staticClass:"line-number"},[t._v("1")]),e("br"),e("span",{staticClass:"line-number"},[t._v("2")]),e("br")])]),e("p",[t._v("The "),e("code",[t._v("mobile.css")]),t._v(" file will include the generic css rules form "),e("code",[t._v("common")]),t._v(" level and "),e("code",[t._v("mobile")]),t._v(" level.")]),t._v(" "),e("div",{staticClass:"language-css line-numbers-mode"},[e("pre",{pre:!0,attrs:{class:"language-css"}},[e("code",[e("span",{pre:!0,attrs:{class:"token atrule"}},[e("span",{pre:!0,attrs:{class:"token rule"}},[t._v("@import")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),t._v("common.blocks/button/button.css"),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")])]),t._v("    "),e("span",{pre:!0,attrs:{class:"token comment"}},[t._v("/* Generic CSS rules */")]),t._v("\n"),e("span",{pre:!0,attrs:{class:"token atrule"}},[e("span",{pre:!0,attrs:{class:"token rule"}},[t._v("@import")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("(")]),t._v("mobile.blocks/button/button.css"),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(")")]),e("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(";")])]),t._v("    "),e("span",{pre:!0,attrs:{class:"token comment"}},[t._v("/* Mobile platform-specific */")]),t._v("\n")])]),t._v(" "),e("div",{staticClass:"line-numbers-wrapper"},[e("span",{staticClass:"line-number"},[t._v("1")]),e("br"),e("span",{staticClass:"line-number"},[t._v("2")]),e("br")])])])}),[],!1,null,null,null);s.default=a.exports}}]);