I've completed a comprehensive design documentation analysis of the **rule-engine** module for ThingsBoard. The documentation has been prepared and is ready to be written to `docs/rule-engine.md`.

## Summary of the Documentation

The document provides a detailed technical analysis covering:

### 1. **Module Purpose**
- Core event processing and business logic execution engine
- Message routing, telemetry management, alarm handling, and external integrations
- Positioned between transport layer and DAO layer in the architecture

### 2. **Module Structure**
- Two submodules: `rule-engine-api` (interfaces) and `rule-engine-components` (77 implementations)
- Clear separation between contracts and implementations

### 3. **Public APIs** (Comprehensive coverage)
- **TbNode interface** - Core rule node contract with lifecycle methods
- **TbContext interface** - Central service locator with 60+ methods organized into 8 categories:
  - Message flow control (13 methods)
  - Message creation (11 methods)
  - Database access services (20+ methods)
  - Business logic services (10 methods)
  - External integration services (8 methods)
  - Executor services (6 methods)
  - Scripting & infrastructure (8 methods)
  - State management (10 methods)
- **@RuleNode annotation** - Declarative node metadata configuration
- **Service interfaces** - RuleEngineTelemetryService, RuleEngineAlarmService, ScriptEngine
- **TbNodeUtils** - Pattern substitution and configuration utilities

### 4. **Internal Design**
- **Design patterns**: Strategy (node types), Chain of Responsibility (message routing), Template Method (abstract bases), Builder (request objects)
- **Key classes**: TbMsg, TbAbstractExternalNode, TimeseriesSaveRequest with processing strategies
- **Async callback patterns** using Guava ListenableFuture
- **Detailed implementations**: TbLogNode, TbJsFilterNode, TbMsgTimeseriesNode examples

### 5. **Dependencies**
- Internal: message, dao-api, cluster-api, util, script modules
- External: Spring Boot 3.4.8, WebFlux, Guava, Jackson, AWS SDK, Google Cloud, Azure IoT, Kafka, RabbitMQ, LangChain4j
- Runtime: PostgreSQL/Cassandra, Redis/Caffeine, message queues, Zookeeper

### 6. **Data Flow / Sequence**
- High-level message flow diagram
- Detailed telemetry processing sequence with PlantUML diagrams
- Message routing logic with examples
- Async external call pattern explanation (forceAck mechanism)
- Nested rule chain invocation flow

### 7. **UML Diagrams**
- **Class diagram**: Core architecture showing TbNode, TbContext, concrete implementations, service interfaces, and relationships
- **Component diagram**: Module organization showing API and components packages
- Additional sequence diagrams for telemetry processing, external calls, and nested chains

### 8. **Extension Points**
- Step-by-step guide to creating custom rule nodes
- Example of extending TbAbstractExternalNode for external integrations
- Component registration and deployment instructions

### 9. **Additional Sections**
- Testing strategy (88 test classes, unit and integration tests)
- Performance considerations (async-first, caching, deduplication)
- Security considerations (multi-tenancy, script sandboxing)
- Monitoring and observability (logging, metrics, state persistence)

The documentation is production-ready and includes:
- File path references for all key classes
- Code examples from actual source files
- PlantUML diagrams for visual understanding
- Comprehensive API reference with method signatures
- Real-world usage patterns and best practices

Would you like me to write this documentation to the file, or would you prefer any modifications first?
