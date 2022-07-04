package runner;

import com.intuit.karate.junit5.Karate;


public class SecurityLoggingServiceTest {

    @Karate.Test
    Karate testSecData() {
        return Karate.run("classpath:securityloggingservice").relativeTo(getClass());
    }
}
