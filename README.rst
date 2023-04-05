
Pysura - BETA
=============

Hasura + Python = Pysura. An open source solution.
--------------------------------------------------

Because everyone should be a code wizard.


.. image:: images/code_wizard.png
   :target: images/code_wizard.png
   :alt: img_1.png


Requirements:
^^^^^^^^^^^^^

To deploy Hasura with Pysura with baked in Auth and a templated Flutter Frontend:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


* Python 3.9+
* gcloud CLI
* gcloud beta CLI
* A billing account with Google Cloud
* Docker (Make sure it's running in the background or your deployment will fail!)
* Firebase CLI
* npm
* Dart
* Flutter

.. code-block:: commandline

   pip install pysura
   pysura
   (pysura_cli) >>> setup_pysura

Note: The installer is doing a lot of things. Some of them take a long time, like creating databases, firewalls, and VPC
networks. Sometimes it might look frozen, but give it some time to do its thing. It's automagically building an entire
application for you. I promise doing this by hand takes longer. ;)


.. image:: images/pysura_deployed.png
   :target: images/pysura_deployed.png
   :alt: img.png


Is this multi-platform compatible?
----------------------------------

Mac - Yes, I developed it on a Mac!

Linux - It should work on Linux, it is untested. Let me know!

Windows - With minor updates it should work. I think the majority of the deployer works, but it might run into issues on
the Firebase and Flutterfire CLI's.

What is Pysura?
---------------

Pysura is a CLI tool that's designed to make building and deploying multi-tenant enterprise grade applications as easy
as a freshman year algorithms class. It's a highly opinionated way because it's the right way.

It's kind of like running npm init, if npm was for backends and frontends, it provides your backend, auth, and database
for you in the cloud in a way that is infinitely scalable and uses zero-trust, with a type-safe GraphQL backend and a
bring-your-own front-end approach with special built-in support for Flutter which is the default setup.

Why Flutter?

So that it doesn't matter what you are building, you can build it on Pysura. It's about damn time that Python developers
have better mobile support. Let's bring python to mobile. Let's bring python to the web. Let's bring python to the edge.
Let's bring python everywhere. And let's skin it with Flutter and feed it all the data it wants with GraphQL and Hasura.

Do I have to use Flutter for the frontend? No way! Pysura places firebase in front of your Hasura instance, so if your
frontend of choice supports Firebase Auth integrations or libraries, you can use it, or even better open a PR and add a
template for your provider. You *do* need Flutter for installation

What does the Pysura installer do?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


* Authenticates you with gcloud
* Creates a new project in Google Cloud
* Sets up a VPC network inside the project
* Creates a new Cloud SQL instance running Postgres 14
* Stores all Env variables in secret manager to be loaded from containers
* Creates a new Hasura instance in Cloud Run with scaling settings always allocating memory for at least 1 instance
* Attaches Firebase to the project
* Deploys firebase functions triggering on user.create/delete managing Hasura user data each with min instances set to 1
* Adds JWT authentication via Firebase to Hasura with phone sign in
* Creates a new Flutter app with Firebase Auth using flutterfire
* Configures Android signing keys (COMING SOON: Auto app icon configuration)
* Configures iOS URL schemes (COMING SOON: Auto app icon configuration)
* Updates the default flutter template to use the Pysura template for Flutter 
* Deploys the flutter template to Firebase hosting for the web. (COMING SOON: Auto app icon configuration)
* Deploys a default microservice on Cloud Run using Pysura! Includes default event that handles JWT claim changes

What is a Pysura Microservice?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It's a wrapper around a FastAPI app that holds a collection of actions, events, and chron-jobs related to its function.
I.e. A payment microservice might have all code related to payment processing. It bakes in Auth with an extra decorator
which gives you easy access to the calling user each time a method is called. This works by using opaque tokens that
pass through the headers into the microservice. It's a very simple way to do auth, and it's very secure. It gives full
RBAC at a column level, and you can design rather complex auth rules using Hasura's permission system. Each action,
event, and chron-job is placed in a separate file with routing already handled and the calling users information passed
in the calling context. It makes it very easy to build your business logic in a clean, consistent way that is easy to
test and maintain, and also easy to hand off to other developers.

Pysura uses middleware to handle the auth, and provide you access to app resources like the database, and the caller.
It wraps FastAPI, and uses a router for each action, event, or chron-job. Separating the business logic into collections
of microservices each containing folders of actions, events, and chron-jobs each delegated to their own file which 
makes it easy to scale and maintain.

Front-end clients should utilize the Hasura GraphQL API to access and mutate the data in the database. This is the 
recommended way to access the data. It is important to make sure you set up proper roles and permissions in Hasura to
ensure that only the correct users can access the data meant for them. By default, Pysura includes a user and admin role

Actions are used to allow the front-end client a way to perform custom business logic, or do a task that requires
calling third party APIs or services. Actions are called via the Hasura GraphQL API, and are executed on the 
microservice instance.

Events are used to trigger custom business logic when something occurs in the database. For example, when a user is
created, you might want to send them a welcome email. Events are triggered by Hasura (via the Database),
and are executed on the microservice instance.

Crons are used to trigger custom business logic on a schedule. For example, you might want to send a report to the
admin every day at 8am. Crons are triggered by Hasura (via the Database), and are executed on the microservice instance.

By default, the application is configured with an event secret that must be passed to all microservices in the header
from Hasura. This ensures that all traffic is coming from Hasura, and not from a malicious source. This makes things
SUPER secure, with JWT auth, and event secrets. It's a very secure way to build an application.

Do I need to deploy Hasura with Pysura to use it?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As of right now yes. In the future, no!

Is this just a wrapper for the Hasura CLI?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Pysura does *not* use the Hasura CLI, and instead manages the metadata directly via retrieving it and overwriting it.

It's important to note that Pysura will add the local machine of its installer's IP to the allow-list for the database.
This is to allow pysura to connect via pscopg2 for things like table management. You'll need to de-authorize the network
if you want to remove the machine from the allow-list once setup is complete. TODO: Make a deauthorize command.

Limitations:
^^^^^^^^^^^^

Currently, this only supports a Google-based deployment/stack. Easily fixable. Just need a fellow AWS/Azure/Etc. wizard
who can translate the gcloud commands. I think the portability is pretty high since everything is done from the CLI. The
setup wizard is just curling everything.

Neat! But it doesn't support my cloud provider, when will you be adding AWS/Azure/Etc. support?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

I won't. You can. I built this because I needed it. If our stack changes providers, or potentially if someone was
willing to pay for it, I'd be willing to add support for other providers. But as of now, the best bet would be to open a
PR and add support for your provider of choice. I tried to design it to be pretty modular. The gcloud --format=json flag
is what changed the game when I found it. Maybe try ChatGPT to translate the gcloud commands to AWS/Azure/Etc. commands.

FAQ:
^^^^

Q: I broke the installer, something wasn't enabled properly. (I didn't have docker running, didn't have gcloud
installed, etc.)

A: Best bet is to try to rerun the installer, it might throw some errors but it should recover for the most part. If it
doesn't, then you should trash the project and rerun the setup. Just remember to go to billing and disable the old
project, and shut it down.

Q: How do I contribute?

A: Read over the current code, and see if you can make it better. If you can, open a PR. If you can't, open an issue or
a feature request for something that would make it better.

Q: Is this affiliated with Hasura, Google, or Firebase?

A: No, this has no affiliation with Hasura, Google, or Firebase. In no way should this be considered an official product
of any of these companies. Although this makes heavy use of tools and API's provided it is in no way an official product
of any company or tool used.

Q: I'm not sure what to enter for one of the command line prompts, what should I do?

A: If you aren't sure what to enter, most of the time the provided example should work.

Q: One of the choices in the list of options for a prompt doesn't make sense, or there is something missing!

A: Please open an issue or a feature request. I'm sure I missed some things. Stitching this together required a bit of
everything, including working outside my area of expertise.

TODOS:
^^^^^^

Remove pyscopg2 dependency to drop postgres req
===============================================

DONE:


* [x] Add support for Google Cloud
* [x] Add support for Firebase Auth
* [x] Add ios/android wizard
* [x] Add support for Flutter
* [x] Hasura Autodeployer

HIGH PRIORITY:


* [ ] Add table manager @Tristen
* [ ] Add microservice manager @Tristen
* [ ] Add action wizard @Tristen
* [ ] Add event wizard @Tristen
* [ ] Add cron wizard @Tristen
* [ ] Add support for other auth providers (Auth0, etc) @Unclaimed

  * [ ] Auth0
  * [ ] ???

* [ ] Flutter SSR bindings for Web @Unclaimed
* [ ] Caching Wizard @Tristen
* [ ] Built in API Version Control @Tristen

LOW PRIORITY:


* [ ] Add support for AWS/Azure/Etc.
* [ ] Add support for other databases (Postgres, MySQL, BigQuery, etc)
* [ ] Add support for other frontends (React, Vue, etc)
* [ ] Rewrite the CLI tool in a more modular way, with command plug-ins.
* [ ] It should be possible to introspect the entirety of the gcloud CLI by parsing the output of ``gcloud help``. And
  walking the CLI tool This would allow for a more dynamic CLI tool that could be used for other projects.
