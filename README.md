# GridGain 8 Examples

## Overview

This project contains code examples for GridGain 8 Community Edition (built on
Apache® Ignite™).

Examples are shipped as a Maven project and build on their own: the GridGain
engine version is pinned as the `revision` property in `pom.xml` and resolved
from the GridGain external Maven repository. This repository contains examples
only, no engine code.

Requirements: JDK 17 and Maven 3.6+ (this is what CI verifies).

CI runs on GridGain's internal TeamCity, not GitHub Actions — see the
`GridGain8_Test_CommunityEdition_Examples` and
`GridGain8_Test_CommunityEdition_ExamplesLGPL` jobs for build status and
artifacts.

## Building

A bare clone builds with plain Maven:

```shell
mvn clean package
```

### Against a local CE build

To build the examples against a GridGain 8 CE source tree you have locally,
instead of the pinned release:

1. Install the CE artifacts into your local Maven repository (slow the first
   time — it builds the engine):

   ```shell
   ( cd ../gridgain && mvn -DskipTests install )
   ```

2. Build via the helper script — it reads the CE version from that source
   tree's pom and forwards it to Maven as `-Drevision=<CE-version>`,
   overriding the pin:

   ```shell
   bin/build.sh clean package
   ```

   The script looks for CE at `../gridgain`; pass `CE_DIR=/path/to/gridgain`
   for another location, or pass `-Drevision=<CE-version>` to `mvn` yourself.

The project is split into two modules:

- `examples` — Java examples for core GridGain / Ignite features.
- `examples-spring-data` — Spring Data examples (`org.apache.ignite.examples.springdata.*`).

### Choosing the Spring Data line

8.9 published the engine module as `ignite-spring-data_2.2` and 8.10 publishes it as
`ignite-spring-data`, under different packages. Only `PersonRepository` and `SpringAppCfg` differ, so
they live in a per-line source root and the rest of the module is shared:

| engine | source root | how to select |
| --- | --- | --- |
| 8.9 (default) | `src/main/java-spring-data-2.2` | nothing — this is the default |
| 8.10+ | `src/main/java-spring-data-4` | `-Dspring.data.4` (or `-P spring-data-4`) |

The switch picks both the source root and the engine coordinate. Selecting 8.10 against an 8.9 engine
fails on the coordinate that line never published, which is the honest error rather than a compile
failure deeper in.

The following example categories are included under `examples`:
* `binary` - working with `BinaryObject`s and binary metadata.
* `client` - thin client API usage.
* `cluster` - cluster APIs and cluster groups.
* `computegrid` - distributed compute: tasks, closures, MapReduce.
* `datagrid` - cache operations: CRUD, queries, transactions, near cache, store.
* `datastructures` - distributed data structures: atomics, queues, sets, locks.
* `encryption` - transparent data encryption.
* `events` - local and remote event listening.
* `messaging` - topic-based cluster messaging.
* `misc` - miscellaneous examples (deployment, lifecycle, and more).
* `persistentstore` - Ignite native persistence.
* `servicegrid` - service grid: cluster and node singletons.
* `springdata` - Spring Data integration.
* `sql` - SQL API: DDL, DML, queries, and JDBC.
* `streaming` - data streaming.

Supporting code (shared domain model, utilities) lives under `model` and `util`.

The `examples` module also ships non-Java assets:

- `config` - Ignite configuration files used by the examples.
- `memcached` - PHP script showing cache access via a Memcached client.
- `redis` - example of cache access via a Redis client.
- `rest` - PHP script showing cache access via the HTTP REST API.
- `sql` - sample SQL scripts and data sets.

## Running the examples

Each example has a `main` method — run it from your IDE.

Most examples start an embedded GridGain node in-process. Examples that exercise
multi-node behaviour expect one or more remote nodes started with the shared
configuration `examples/config/example-ignite.xml` (which enables peer-class-loading).
To start such a node from your IDE, run the `ExampleNodeStartup` class.

To run the example self-tests:

```shell
mvn test -pl examples -Dtest=IgniteExamplesSelfTestSuite

# Spring Data examples: 8.9 by default, add -Dspring.data.4 for 8.10+
mvn test -pl :ignite-examples-spring-data -Dtest=IgniteExamplesSpringDataTestSuite
```

Substitute `bin/build.sh` for `mvn` to test against a local CE build.

## Learn more

- GridGain Community Edition: https://www.gridgain.com/products/software/community-edition
- Apache Ignite: https://ignite.apache.org/

## License

Licensed under the Apache License, Version 2.0 — see [LICENSE](LICENSE).
