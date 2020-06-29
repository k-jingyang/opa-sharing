---
marp: true
theme: gaia
_class: lead
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.jpg')
---

![w:300](https://d33wubrfki0l68.cloudfront.net/5305a470ca0260247560b4f94daf68ed62d4a514/85ceb/img/logos/opa-no-text-color.png)

# **Open Policy Agent**
---
# Overview
- OPA
- OPA Syntax Demo
- KMO Use Case
- KMO - OPA Integration (Spring Security) Demo

---
# OPA
Decouples access control policy **decision making** from **enforcement**

![bg right contain](https://d33wubrfki0l68.cloudfront.net/b394f524e15a67457b85fdfeed02ff3f2764eb9e/6ac2b/docs/latest/images/opa-service.svg)

---
# Why decouple?

1. Abstract authorization away from business logic as much as possible (separation of concerns)
1. Different apps can use a common language/platform to specify their access control policy

---
# Why OPA?

1. Rego provides a declarative syntax when it comes to specifying your policy
1. You can update your access control policy without restarting your application
1. OPA allows current policies to be queried centrally - sets us up for integration in future

---
# Demo with VSCode
Query & Policy

![bg right contain](https://d33wubrfki0l68.cloudfront.net/b394f524e15a67457b85fdfeed02ff3f2764eb9e/6ac2b/docs/latest/images/opa-service.svg)

---
# KMO Recap
For each resource, there's owner team, collaborator teams, etc... (ACL of the resource)

A user can be part of many teams. These teams will be matched against the resource ACL to see if the user has access.

---
# How will it be done?
In KMO, each resource is tied to an API endpoint (except for some).

For each access via the API endpoint, **Query** ![w:50 l:50](https://d33wubrfki0l68.cloudfront.net/5305a470ca0260247560b4f94daf68ed62d4a514/85ceb/img/logos/opa-no-text-color.png), and supply ACL for a **Decision**

![bg right:42% contain](https://d33wubrfki0l68.cloudfront.net/b394f524e15a67457b85fdfeed02ff3f2764eb9e/6ac2b/docs/latest/images/opa-service.svg)

---
# Demo with Spring Security

1. Show unsecured access to general info and location info
1. Show access control information (next slide)
1. Secure the application, explain AccessDecisionManager & Voter
1. Access general info with *aqua_grunt*
1. Open OPA container logs
`docker logs -f <CONTAINER_NAME> 2>&1 >/dev/null | jq '.'`
1. Access general info then location info with *magma_grunt*
1. Access location info with *magma_galatic_grunt*
1. Show tests

---

## Team & Resource Information

| Resource ID   | Owner  | Collaborator | Viewer |
|---------------|:------:|:------------:|:------:|
| 1 (Bulbasaur) | Rocket | Galactic     | Magma  |

## Access Control Policy

|          | Owner | Collaborator | Viewer |
|----------|:-----:|:------------:|:------:|
| General  | READ  | READ         | READ   |
| Location | READ  | READ         |        |


---
# Deployment
Sidecar Pattern in Kubernetes

![w:425](./sidecar.png)
