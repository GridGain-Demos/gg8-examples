# GridGain 8 Examples

## Overview

This project contains code examples for GridGain 8 Community Edition (built on
Apache® Ignite™).

Examples are shipped as a Maven project. They build against a locally
installed GridGain 8 CE checkout — this repository contains examples only,
no engine code, and **no GridGain version is pinned**.

Requirements: JDK 17 and Maven 3.6+ (this is what CI verifies).

CI runs on GridGain's internal TeamCity, not GitHub Actions — see the
`GridGain8_Test_CommunityEdition_Examples` and
`GridGain8_Test_CommunityEdition_ExamplesLGPL` jobs for build status and
artifacts.

## Building

This project is **not** a standalone build. It requires the GridGain 8 CE
sources alongside it, installed into your local Maven repository.

1. Clone GridGain 8 CE next to this checkout (default path: `../gridgain`):

   ```shell
   git clone https://github.com/gridgain/gridgain.git ../gridgain
   ```

2. Install CE artifacts into your local Maven repository (slow the first
   time — it builds the engine):

   ```shell
   ( cd ../gridgain && mvn -DskipTests install )
   ```

3. Build the examples via the helper script — it reads the CE version from
   the sibling pom and forwards it to Maven as `-Drevision=<CE-version>`,
   which is what the examples pom binds dependencies against:

   ```shell
   bin/build.sh clean package
   ```

   Pass `CE_DIR=/path/to/gridgain` if your CE checkout isn't at `../gridgain`.
   If you'd rather invoke Maven yourself, pass `-Drevision=<CE-version>`
   directly — `mvn` without `-Drevision` resolves dependencies against a
   sentinel coordinate and fails with a clear "could not find artifact"
   message.

The project is split into two modules:

- `examples` — Java examples for core GridGain / Ignite features.
- `examples-ml` — machine-learning examples (`org.apache.ignite.examples.ml.*`).

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

The following example categories are included under `examples-ml`:
* `clustering` - clustering algorithms (e.g. K-Means).
* `dataset` - the ML dataset API.
* `environment` - learning environment and parallelism.
* `genetic` - genetic algorithms.
* `inference` - model inference and serving.
* `knn` - k-nearest-neighbors classification and regression.
* `mleap` - importing MLeap models.
* `multiclass` - multiclass classification.
* `naivebayes` - Naive Bayes classifiers.
* `nn` - neural networks (multilayer perceptron).
* `preprocessing` - feature preprocessing.
* `recommendation` - recommendation systems.
* `regression` - linear and logistic regression.
* `selection` - model selection and cross-validation.
* `sql` - training ML models over SQL data.
* `svm` - support vector machines.
* `tree` - decision trees, random forest, gradient boosting.
* `tutorial` - a step-by-step ML tutorial.
* `xgboost` - importing XGBoost models.

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

To run the example self-tests (assumes you've completed the Building steps
above so the CE artifacts are in your local Maven repository):

```shell
bin/build.sh test -Dtest=IgniteExamplesSelfTestSuite     # core examples
bin/build.sh test -Dtest=IgniteExamplesMLTestSuite        # machine-learning examples
```

## Learn more

- GridGain Community Edition: https://www.gridgain.com/products/software/community-edition
- Apache Ignite: https://ignite.apache.org/

## License

Licensed under the Apache License, Version 2.0 — see [LICENSE](LICENSE).
