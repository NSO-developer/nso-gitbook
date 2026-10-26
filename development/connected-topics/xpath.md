---
description: Implementation details for XPath.
icon: value-absolute
---

# XPath

The NSO XPath documentation covers implementation details and extension to or deviation from the XPath 1.0 documentation and YANG RFC 7950 XPath extensions respectively. The XPath 1.0 documentation and YANG RFCs are the main reference guides for the NSO XPath implementation, while the NSO documentation complements them.

{% embed url="https://www.w3.org/TR/1999/REC-xpath-19991116/" %}

{% embed url="https://datatracker.ietf.org/doc/html/rfc7950#section-10" %}

{% embed url="https://nso-docs.cisco.com/guides/resources/man/tailf_yang_extensions.5#xpath-functions" %}

## Query API Extensions

The following XPath 2.0 functions are available when evaluating Query API expressions. This list does not imply general XPath 2.0 support in other NSO XPath contexts.

| Function | Arguments | Description |
| --- | --- | --- |
| `lower-case(arg)` | One XPath expression | Returns the string value of `arg` with its characters converted to lowercase. |
| `upper-case(arg)` | One XPath expression | Returns the string value of `arg` with its characters converted to uppercase. |
