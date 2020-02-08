package org.example

data class Language(val name: String, val hotness: Int)

class MyLibrary {
    /**
     * @return data relating to the Kotlin {@code Language}.
     */
    fun kotlinLanguage() = Language("Kotlin", 10)
}
