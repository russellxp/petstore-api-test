package runners;
import com.intuit.karate.junit5.Karate;
class PetTestRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features").relativeTo(getClass());
    }
}
