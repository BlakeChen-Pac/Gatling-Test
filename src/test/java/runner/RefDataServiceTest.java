package runner;

import com.intuit.karate.junit5.Karate;


class RefDataServiceTest {

//    @BeforeAll
//    public static void beforeAll() {
//        System.out.println("You can add set up here, run before each class");
//    }
//
//    @BeforeEach
//    public static void beforeEach() {
//        System.out.println("You can add set up here, run before each method");
//    }

    // @AfterAll
    // @AfterEach

//    @Karate.Test
//    Karate testRefData() {
//        return Karate.run("classpath:refdataservice").tags("@debug").relativeTo(getClass());
//    }


    @Karate.Test
    Karate testRefData() {
        return Karate.run("classpath:refdataservice").relativeTo(getClass());
    }

    //    You can put multiple test here:
    //    @Karate.Test
    //    Karate testSystemProperty() {
    //        return Karate.run("classpath:karate/tags.feature")
    //                .tags("@second")
    //                .karateEnv("e2e")
    //                .systemProperty("foo", "bar");
    //    }
}
