# GridGain 8 Community Edition — Examples

This repository contains the example applications for GridGain 8 Community Edition
(built on Apache® Ignite™). The examples live here, separate from the engine source,
so you can browse and run them without cloning the full product.

This repository hosts **examples only** — no engine code. The examples build against
published GridGain artifacts.

## Modules

- `examples/` — Java examples for GridGain / Ignite features (cache, compute, SQL,
  services, data streaming, messaging, events, and more).
- `examples-ml/` — machine-learning examples (`org.apache.ignite.examples.ml.*`).

## Requirements

- JDK 11 or newer
- Maven 3.6 or newer

## Building

The examples are a standalone Maven project:

```bash
git clone https://github.com/GridGain-Demos/gg8-examples.git
cd gg8-examples
mvn clean package
```

## Running an example

Each example has a `main` method — run it from your IDE, or via the Maven exec plugin.
Examples that need a running cluster expect remote nodes started with the shared
configuration `examples/config/example-ignite.xml`; the helper class
`ExampleNodeStartup` starts such a node.

## Learn more

- GridGain Community Edition: https://www.gridgain.com/products/software/community-edition
- Apache Ignite: https://ignite.apache.org/

## License

Licensed under the Apache License, Version 2.0 — see [LICENSE](LICENSE).
