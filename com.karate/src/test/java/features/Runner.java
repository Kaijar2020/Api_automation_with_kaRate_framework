package features;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;
//import org.junit.runner.RunWith;


 //@RunWith(Karate.class)

public class Runner {
  @Karate.Test
   Karate getApiRun(){
   return Karate.run("src/test/java/features");

  }


}

