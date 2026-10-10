//> using scala 3.9.0
//> using dep com.github.ghostdogpr::caliban-gateway:3.2.0
//> using dep com.github.ghostdogpr::caliban-quick:3.2.0

import caliban.QuickAdapter
import caliban.gateway.{ Gateway, RemoteGraphQLConfig, Subgraph }
import zio.*
import zio.http.*

object Main extends ZIOAppDefault {

  private val config = RemoteGraphQLConfig.default.withExecution(_.forwardIncomingHeaders("Authorization"))

  private def subgraph(name: String, port: Int) =
    Subgraph.federation(name, url"http://127.0.0.1/graphql".port(port), config)

  private val gateway =
    Gateway.compose(subgraph("accounts", 5221), subgraph("inventory", 5222), subgraph("products", 5223), subgraph("reviews", 5224))

  override def run =
    for {
      interpreter <- gateway.interpreter
      server      <- QuickAdapter(interpreter).runServer(5220, "/graphql")
    } yield server
}
