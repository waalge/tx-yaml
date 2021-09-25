# TxYaml

Manage transactions with yamls not bash.

## Components 

**Yaml schema**: 

For language server integration and verification. 
Provides suggestions and flags errors.

**Build**: 

Convert to shell script to run in cli. 

**Address book**:

(TODO) Add the ability to use aliases for addresses 

## Setup 

For nvim + Coc users:

- Have a yaml langage server `:CocInstall coc-yaml`
- Add the following schema (edit the coc Config which is accessed by `:CocConfig`) 
```json 
  "yaml.schemas": {
  "./tx.schema.json" : ["*.tx.yaml"]
  }
```



## Use 

Create a new `.tx.yaml` file. 
```
vim my-first.tx.yaml 
```
Start typing. Acknowledge the errors and prompts to create a well formed transaction file. 


To build. 
```
build my-first.tx.yaml 
```

## Motivations

Writing and working with bash scripts is painful.
Yaml is much more pleasant.

The tooling will be flexible, minimal, and extensible. 

It also seemed achievable to understand how this would work, 
and then execute this with very limited time. 

## Reflections

The problem is that building transactions is convoluted. 
The idea implemented here transposes the problem more than solving this.
Although yaml is more plesant than bash scripting, I think it is still of limited use.

Trying to work out the syntax of a json schema has taken quite a lot of time. 

### Points of improvement 

Really, the hack that turns yaml to bash and executes via the `cardano-cli` should be replaced by interfacing the Api. 

Main should take command line args. 

The yaml parser is currently a complete lie. I ran out time.
