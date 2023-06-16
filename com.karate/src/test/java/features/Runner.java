package features;

import com.intuit.karate.junit5.Karate;

public class Runner {

    @Karate.Test
    Karate apiGETresponseTest(){
        return Karate.run("api").relativeTo(getClass());
    }
}
