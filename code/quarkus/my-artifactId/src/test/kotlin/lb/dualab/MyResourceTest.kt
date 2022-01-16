package lb.dualab

import io.quarkus.test.junit.QuarkusTest
import io.restassured.RestAssured.given
import org.hamcrest.CoreMatchers.`is`
import org.junit.jupiter.api.Test

@QuarkusTest
class MyResourceTest {
    @Test
    fun testGreetingEndPOint() {
        given().`when`()
                .get("/greeting/pippo")
                .then()
                .statusCode(200)
                .body(`is`("hello pippo"))
    }
}