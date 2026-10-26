---
description: Implementation details for XPath.
---

# XPath

The XPath implementation in NSO is based on XPath 1.0 specification with YANG RFC 7950 XPath extensions. The main reference guides for the NSO XPath implementation are therefore the XPath 1.0 documentation and the YANG RFC:

* XML Path Language (XPath) at [www.w3.org](https://www.w3.org/TR/1999/REC-xpath-19991116/)

* RFC 7950: The YANG 1.1 Data Modeling Language at [IETF Datatracker](https://datatracker.ietf.org/doc/html/rfc7950#section-10)

Specific extensions and deviations to the XPath 1.0 specification are described below and in the [tailf_yang_extensions](../../resources/man/tailf_yang_extensions.5.md#xpath-functions) manpage.

Also included here is a short, non-exhaustive list of common, useful XPath functions.

## Query API Extensions

The following XPath 2.0 functions are available when evaluating Query API expressions. This list does not imply general XPath 2.0 support in other NSO XPath contexts.

| Function | Arguments | Description |
| --- | --- | --- |
| `lower-case(arg)` | One XPath expression | Returns the string value of `arg` with its characters converted to lowercase. |
| `upper-case(arg)` | One XPath expression | Returns the string value of `arg` with its characters converted to uppercase. |

## A Few Common Functions

<details>

<summary>Type Conversion</summary>

* [bit-is-set()](https://datatracker.ietf.org/doc/html/rfc7950#section-10.6.1)
* [boolean()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-boolean)
* [enum-value()](https://datatracker.ietf.org/doc/html/rfc7950#section-10.5.1)
* [number()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-number)
* [string()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-string)

</details>

<details>

<summary>String Handling</summary>

* [concat()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-concat)
* [contains()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-contains)
* [normalize-space()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-normalize-space)
* [re-match()](https://datatracker.ietf.org/doc/html/rfc7950#section-10.2.1)
* [starts-with()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-starts-with)
* [substring()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-substring)
* [substring-after()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-substring-after)
* [substring-before()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-substring-before)
* [translate()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-translate)

</details>

<details>

<summary>Model Navigation</summary>

* [current()](https://datatracker.ietf.org/doc/html/rfc7950#section-10.1.1)
* [deref()](https://datatracker.ietf.org/doc/html/rfc7950#section-10.3.1)
* [last()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-last)
* [sort-by()](../../resources/man/tailf_yang_extensions.5.md) in Manual Pages

</details>

<details>

<summary>Other</summary>

* [compare()](../../resources/man/tailf_yang_extensions.5.md) in Manual Pages
* [count()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-count)
* [max()](../../resources/man/tailf_yang_extensions.5.md) in Manual Pages
* [min()](../../resources/man/tailf_yang_extensions.5.md) in Manual Pages
* [not()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-not)
* [sum()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-sum)

</details>
