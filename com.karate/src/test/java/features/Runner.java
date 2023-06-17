package features;

import com.intuit.karate.junit5.Karate;

public class Runner {

    @Karate.Test
    Karate apiGETresponseTest(){
        return Karate.run("api").relativeTo(getClass());
    }

    @Karate.Test
    Karate apiPOSTresponseTest(){
        return Karate.run("postApi").relativeTo(getClass());
    }
    @Karate.Test
    Karate apiPUTresponseTest(){
        return Karate.run("put_Api").relativeTo(getClass());
    }
    @Karate.Test
    Karate apiE2ETestingresponseTest(){
        return Karate.run("e2e_apiTesting").relativeTo(getClass());
    }
}

