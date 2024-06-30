/** 
Contact information for the exposed API.
 */
type contact = {
  // The identifying name of the contact person/organization.
  name?: string,
  // The URL pointing to the contact information. MUST be in the format of a URL.
  url?: string,
  // The email address of the contact person/organization. MUST be in the format of an email address.
  email?: string,
}

/** 
License information for the exposed API.
 */
type license = {
  // The license name used for the API.
  name: string,
  // An SPDX license expression for the API. The identifier field is mutually exclusive of the url field.
  identifier?: string,
  // A URL to the license used for the API. This MUST be in the form of a URL. The url field is mutually exclusive of the identifier field.
  url?: string,
}

/**
The object provides metadata about the API. The metadata MAY be used by the clients if needed, and MAY be presented in editing or documentation generation tools for convenience.
 */
type info = {
  // The title of the API.
  title: string,
  // A short summary of the API.
  summary?: string,
  // A description of the API. CommonMark syntax MAY be used for rich text representation.
  description?: string,
  // A URL to the Terms of Service for the API. This MUST be in the form of a URL.
  termsOfService?: string,
  // The contact information for the exposed API.
  contact?: contact,
  // The license information for the exposed API.
  license?: license,
  // The version of the OpenAPI document (which is distinct from the OpenAPI Specification version or the API implementation version).
  version: string,
}

type server
type paths
type webhooks
type components
type securityRequirement
type tag
type externalDocumentation

/**
Typed interfaces for OpenAPI 3.1.0  
see https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.1.0.md  
  
This is the root object of the OpenAPI document.
 */
type t = {
  // This string MUST be the version number of the OpenAPI Specification that the OpenAPI document uses. The openapi field SHOULD be used by tooling to interpret the OpenAPI document. This is not related to the API info.version string.
  openapi: string,
  // Provides metadata about the API. The metadata MAY be used by tooling as required.
  info: info,
  // The default value for the $schema keyword within Schema Objects contained within this OAS document. This MUST be in the form of a URI.
  jsonSchemaDialect?: string,
  // An array of Server Objects, which provide connectivity information to a target server. If the servers property is not provided, or is an empty array, the default value would be a Server Object with a url value of `/`.
  servers?: array<server>,
  // The available paths and operations for the API.
  paths?: paths,
  // The incoming webhooks that MAY be received as part of this API and that the API consumer MAY choose to implement. Closely related to the callbacks feature, this section describes requests initiated other than by an API call, for example by an out of band registration. The key name is a unique string to refer to each webhook, while the (optionally referenced) Path Item Object describes a request that may be initiated by the API provider and the expected responses. An example is available.
  webhooks?: webhooks,
  // An element to hold various schemas for the document.
  components?: components,
  // A declaration of which security mechanisms can be used across the API. The list of values includes alternative security requirement objects that can be used. Only one of the security requirement objects need to be satisfied to authorize a request. Individual operations can override this definition. To make security optional, an empty security requirement ({}) can be included in the array.
  security?: array<securityRequirement>,
  // A list of tags used by the document with additional metadata. The order of the tags can be used to reflect on their order by the parsing tools. Not all tags that are used by the Operation Object must be declared. The tags that are not declared MAY be organized randomly or based on the tools' logic. Each tag name in the list MUST be unique.
  tags?: array<tag>,
  // Additional external documentation.
  externalDocs?: externalDocumentation,
}
