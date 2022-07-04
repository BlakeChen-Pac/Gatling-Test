package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerfTest extends Simulation {

  val protocol = karateProtocol()

//  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
//  protocol.runner.karateEnv("perf")

  val createFeature = scenario("create").exec(karateFeature("classpath:performance/AirportCode.feature"))
//  val delete = scenario("delete").exec(karateFeature("classpath:mock/cats-delete.feature@name=delete"))

  setUp(
    createFeature.inject(
      atOnceUsers(1)
    ).protocols(protocol)
//    delete.inject(rampUsers(5) during (5 seconds)).protocols(protocol)
  )

}