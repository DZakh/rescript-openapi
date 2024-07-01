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

/**
An object representing a Server Variable for server URL template substitution.
 */
type serverVariable = {
  // The default value to use for substitution, which SHALL be sent if an alternate value is not supplied. Note this behavior is different than the Schema Object's treatment of default values, because in those cases parameter values are optional. If the enum is defined, the value MUST exist in the enum's values.
  default: string,
  // An enumeration of string values to be used if the substitution options are from a limited set. The array MUST NOT be empty.
  enum?: array<string>,
  // An optional description for the server variable. CommonMark syntax MAY be used for rich text representation.
  description?: string,
}

/**
An object representing a Server.
 */
type server = {
  // A URL to the target host. This URL supports Server Variables and MAY be relative, to indicate that the host location is relative to the location where the OpenAPI document is being served. Variable substitutions will be made when a variable is named in {brackets}.
  url: string,
  // An optional string describing the host designated by the URL. CommonMark syntax MAY be used for rich text representation.
  description?: string,
  // A map between a variable name and its value. The value is used for substitution in the server's URL template.
  variables?: dict<serverVariable>,
}

type externalDocumentation = {
  // A description of the target documentation. CommonMark syntax MAY be used for rich text representation.
  description?: string,
  // The URL for the target documentation. This MUST be in the form of a URL.
  url: string,
}

type parameterOrReference

type requestBodyOrReference

type responses

type callbackOrReference

type securityRequirement

/**
Describes a single API operation on a path.
 */
type operation = {
  // A list of tags for API documentation control. Tags can be used for logical grouping of operations by resources or any other qualifier.
  tags?: array<string>,
  // A short summary of what the operation does.
  summary?: string,
  // A verbose explanation of the operation behavior. CommonMark syntax MAY be used for rich text representation.
  description?: string,
  // Additional external documentation for this operation.
  externalDocs?: externalDocumentation,
  // Unique string used to identify the operation. The id MUST be unique among all operations described in the API. The operationId value is case-sensitive. Tools and libraries MAY use the operationId to uniquely identify an operation, therefore, it is RECOMMENDED to follow common programming naming conventions.
  operationId: string,
  // A list of parameters that are applicable for this operation. If a parameter is already defined at the Path Item, the new definition will override it but can never remove it. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a name and location. The list can use the Reference Object to link to parameters that are defined at the OpenAPI Object's components/parameters.
  parameters?: array<parameterOrReference>,
  // The request body applicable for this operation. The requestBody is fully supported in HTTP methods where the HTTP 1.1 specification RFC7231 has explicitly defined semantics for request bodies. In other cases where the HTTP spec is vague (such as GET, HEAD and DELETE), requestBody is permitted but does not have well-defined semantics and SHOULD be avoided if possible.
  requestBody?: requestBodyOrReference,
  // The list of possible responses as they are returned from executing this operation.
  responses: responses,
  // A map of possible out-of band callbacks related to the parent operation. The key is a unique identifier for the Callback Object. Each value in the map is a Callback Object that describes a request that may be initiated by the API provider and the expected responses.
  callbacks?: dict<callbackOrReference>,
  // Declares this operation to be deprecated. Consumers SHOULD refrain from usage of the declared operation. Default value is false.
  deprecated?: bool,
  // A declaration of which security mechanisms can be used for this operation. The list of values includes alternative security requirement objects that can be used. Only one of the security requirement objects need to be satisfied to authorize a request. To make security optional, an empty security requirement ({}) can be included in the array. This definition overrides any declared top-level security. To remove a top-level security declaration, an empty array can be used.
  security?: array<securityRequirement>,
  // An alternative server array to service this operation. If an alternative server object is specified at the Path Item Object or Root level, it will be overridden by this value.
  servers?: array<server>,
}

/**
Describes the operations available on a single path. A Path Item MAY be empty, due to ACL constraints. The path itself is still exposed to the documentation viewer but they will not know which operations and parameters are available.
 */
type pathItem = {
  // Allows for a referenced definition of this path item. The referenced structure MUST be in the form of a Path Item Object. In case a Path Item Object field appears both in the defined object and the referenced object, the behavior is undefined. See the rules for resolving Relative References.
  @as("$ref")
  ref?: string,
  // An optional, string summary, intended to apply to all operations in this path.
  summary?: string,
  // An optional, string description, intended to apply to all operations in this path. CommonMark syntax MAY be used for rich text representation.
  description?: string,
  // A definition of a GET operation on this path.
  get?: operation,
  // A definition of a PUT operation on this path.
  put?: operation,
  // A definition of a POST operation on this path.
  post?: operation,
  // A definition of a DELETE operation on this path.
  delete?: operation,
  // A definition of a OPTIONS operation on this path.
  options?: operation,
  // A definition of a HEAD operation on this path.
  head?: operation,
  // A definition of a PATCH operation on this path.
  patch?: operation,
  // A definition of a TRACE operation on this path.
  trace?: operation,
  // An alternative server array to service all operations in this path.
  servers?: array<server>,
  // A list of parameters that are applicable for all the operations described under this path. These parameters can be overridden at the operation level, but cannot be removed there. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a name and location. The list can use the Reference Object to link to parameters that are defined at the OpenAPI Object's components/parameters.
  parameters?: array<parameterOrReference>,
}

type webhooks
type components
type tag

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
  paths?: dict<pathItem>,
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
