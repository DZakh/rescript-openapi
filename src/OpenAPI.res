@@warning("-30")

module WithReference = {
  type t<'a>
}

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

type parameter

type schema

type example = {
  // Short description for the example.
  summary?: string,
  // Long description for the example. CommonMark syntax MAY be used for rich text representation.
  description?: string,
  // Embedded literal example. The value field and externalValue field are mutually exclusive. To represent examples of media types that cannot naturally represented in JSON or YAML, use a string value to contain the example, escaping where necessary.
  value?: unknown,
  // A URI that points to the literal example. This provides the capability to reference examples that cannot easily be included in JSON or YAML documents. The value field and externalValue field are mutually exclusive. See the rules for resolving Relative References.
  externalValue?: string,
}

type header

/**
A single encoding definition applied to a single schema property.
 */
type encoding = {
  // The Content-Type for encoding a specific property. Default value depends on the property type: for object - application/json; for array – the default is defined based on the inner type; for all other cases the default is application/octet-stream. The value can be a specific media type (e.g. application/json), a wildcard media type (e.g. image/*), or a comma-separated list of the two types.
  contentType?: string,
  // A map allowing additional information to be provided as headers, for example Content-Disposition. Content-Type is described separately and SHALL be ignored in this section. This property SHALL be ignored if the request body media type is not a multipart.
  headers?: dict<WithReference.t<header>>,
  // Describes how a specific property value will be serialized depending on its type. See Parameter Object for details on the style property. The behavior follows the same values as query parameters, including default values. This property SHALL be ignored if the request body media type is not application/x-www-form-urlencoded or multipart/form-data. If a value is explicitly defined, then the value of contentType (implicit or explicit) SHALL be ignored.
  style?: string,
  // When this is true, property values of type array or object generate separate parameters for each value of the array, or key-value-pair of the map. For other types of properties this property has no effect. When style is form, the default value is true. For all other styles, the default value is false. This property SHALL be ignored if the request body media type is not application/x-www-form-urlencoded or multipart/form-data. If a value is explicitly defined, then the value of contentType (implicit or explicit) SHALL be ignored.
  explode?: bool,
  // Determines whether the parameter value SHOULD allow reserved characters, as defined by RFC3986 :/?#[]@!$&'()*+,;= to be included without percent-encoding. The default value is false. This property SHALL be ignored if the request body media type is not application/x-www-form-urlencoded or multipart/form-data. If a value is explicitly defined, then the value of contentType (implicit or explicit) SHALL be ignored.
  allowReserved?: bool,
}

/** 
Each Media Type Object provides schema and examples for the media type identified by its key.
 */
type mediaType = {
  // The schema defining the content of the request, response, or parameter.
  schema?: schema,
  // Example of the media type. The example object SHOULD be in the correct format as specified by the media type. The example field is mutually exclusive of the examples field. Furthermore, if referencing a schema which contains an example, the example value SHALL override the example provided by the schema.
  example?: unknown,
  // Examples of the media type. Each example object SHOULD match the media type and specified schema if present. The examples field is mutually exclusive of the example field. Furthermore, if referencing a schema which contains an example, the examples value SHALL override the example provided by the schema.
  examples?: dict<WithReference.t<example>>,
  // A map between a property name and its encoding information. The key, being the property name, MUST exist in the schema as a property. The encoding object SHALL only apply to requestBody objects when the media type is multipart or application/x-www-form-urlencoded.
  encoding?: dict<encoding>,
}

/**
Describes a single request body.
 */
type requestBody = {
  // A brief description of the request body. This could contain examples of use. CommonMark syntax MAY be used for rich text representation.
  description?: string,
  // The content of the request body. The key is a media type or media type range and the value describes it. For requests that match multiple keys, only the most specific key is applicable. e.g. text/plain overrides text/*
  content: dict<mediaType>,
  // Determines if the request body is required in the request. Defaults to false.
  required?: bool,
}

type response

/* https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.1.0.md#security-requirement-object */
type securityRequirement = dict<array<string>>

/**
Describes the operations available on a single path. A Path Item MAY be empty, due to ACL constraints. The path itself is still exposed to the documentation viewer but they will not know which operations and parameters are available.
 */
type rec pathItem = {
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
  parameters?: array<WithReference.t<parameter>>,
}
/*
Describes a single API operation on a path.
 */
and operation = {
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
  parameters?: array<WithReference.t<parameter>>,
  // The request body applicable for this operation. The requestBody is fully supported in HTTP methods where the HTTP 1.1 specification RFC7231 has explicitly defined semantics for request bodies. In other cases where the HTTP spec is vague (such as GET, HEAD and DELETE), requestBody is permitted but does not have well-defined semantics and SHOULD be avoided if possible.
  requestBody?: WithReference.t<requestBody>,
  // The list of possible responses as they are returned from executing this operation.
  responses?: dict<WithReference.t<response>>,
  // A map of possible out-of band callbacks related to the parent operation. The key is a unique identifier for the Callback Object. Each value in the map is a Callback Object that describes a request that may be initiated by the API provider and the expected responses.
  callbacks?: dict<WithReference.t<callback>>,
  // Declares this operation to be deprecated. Consumers SHOULD refrain from usage of the declared operation. Default value is false.
  deprecated?: bool,
  // A declaration of which security mechanisms can be used for this operation. The list of values includes alternative security requirement objects that can be used. Only one of the security requirement objects need to be satisfied to authorize a request. To make security optional, an empty security requirement ({}) can be included in the array. This definition overrides any declared top-level security. To remove a top-level security declaration, an empty array can be used.
  security?: array<securityRequirement>,
  // An alternative server array to service this operation. If an alternative server object is specified at the Path Item Object or Root level, it will be overridden by this value.
  servers?: array<server>,
}
and callback = dict<WithReference.t<pathItem>>

type components

/**
Adds metadata to a single tag that is used by the Operation Object. It is not mandatory to have a Tag Object per tag defined in the Operation Object instances.
 */
type tag = {
  // The name of the tag.
  name: string,
  // A description for the tag. CommonMark syntax MAY be used for rich text representation.
  description?: string,
  // Additional external documentation for this tag.
  externalDocs?: externalDocumentation,
}

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
  webhooks?: dict<WithReference.t<pathItem>>,
  // An element to hold various schemas for the document.
  components?: components,
  // A declaration of which security mechanisms can be used across the API. The list of values includes alternative security requirement objects that can be used. Only one of the security requirement objects need to be satisfied to authorize a request. Individual operations can override this definition. To make security optional, an empty security requirement ({}) can be included in the array.
  security?: array<securityRequirement>,
  // A list of tags used by the document with additional metadata. The order of the tags can be used to reflect on their order by the parsing tools. Not all tags that are used by the Operation Object must be declared. The tags that are not declared MAY be organized randomly or based on the tools' logic. Each tag name in the list MUST be unique.
  tags?: array<tag>,
  // Additional external documentation.
  externalDocs?: externalDocumentation,
}
