# ReScript OpenAPI 🕸️

Typesafe OpenAPI for ReScript

- Provides ReScript types to work with [Open API v3.1](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.1.0.md)

## Install

```sh
npm install rescript-openapi rescript-json-schema rescript-schema
```

Update your `rescript.json` file:

```diff
{
  ...
+ "bs-dependencies": ["rescript-openapi", "rescript-json-schema", "rescript-schema"],
+ "bsc-flags": ["-open RescriptSchema"],
}
```

## References

- [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.1.0.md)
