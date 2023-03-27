# Pysura - BETA

### Hasura + Python = Pysura

```commandline
pip install pysura
pysura
(pysura_cli) >>> choose_provider
(pysura_cli) >>> setup_pysura
```
Note: The installer is doing a lot of things. Some of them take a long time, like
creating databases, firewalls, and VPC networks. Sometimes it might look frozen,
but give it some time to do its thing.

## Requirements:

### To deploy Hasura with Pysura with baked in Auth and a templated Flutter Frontend:

- gcloud CLI
- gcloud beta CLI
- A billing account with Google Cloud
- Docker (Make sure it's running in the background or your deploy will fail!)
- Python 3.9+
- Firebase CLI
- npm
- flutterfire_cli
- Dart
- Flutter


# What is Pysura?

Pysura is a CLI tool that's designed to make building and deploying multi-tenant enterprise grade applications as easy as a freshman year algorithms class. It's a highly opinionated way because it's the right way.

It's kind of like running npm init, if npm was for backends and frontends, it provides your backend, auth, and database for you in the cloud in a way that is infinitely scalable and uses zero-trust, with a type-safe GraphQL backend and a bring-your-own front-end approach with special built-in support for Flutter which is the default setup.

Why Flutter?

So that it doesn't matter what you are building, you can build it on Pysura. It's about damn time that Python developers have a valid choice for building mobile applications. Let's bring python to mobile. Let's bring python to the web. Let's bring python to the edge. Let's bring python everywhere. And let's skin it with Flutter and feed it all the data it wants with GraphQL and Hasura.

## Do I need to deploy Hasura with Pysura to use it?

As of right now yes. In the future, no!

## Is this just a wrapper for the Hasura CLI?

Pysura does *not* use the Hasura CLI, and instead manages the metadata directly via retrieving it and overwriting it.

## Limitations:

Currently, this only supports a Google-based deployment/stack. Easily fixable. Just need a fellow AWS/Azure/Etc. wizard who can translate the gcloud commands. I think the portability is pretty high since everything is done from the CLI. The setup wizard is just curling everything.

## Neat! But it doesn't support my cloud provider, when will you be adding AWS/Azure/Etc. support?

I won't. You can. I built this because I needed it. If our stack changes providers, or potentially if someone was willing to pay for it, I'd be willing to add support for other providers. But as of now, the best bet would be to open a PR and add support for your provider of choice. I tried to design it to be pretty modular. The gcloud --format=json flag is what changed the game when I found it.

