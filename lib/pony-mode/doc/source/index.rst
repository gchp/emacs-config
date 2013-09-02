Pony Mode -a Django mode for emacs
==================================

A Django mode for emacs.

Features (Non-exhaustive):
--------------------------

* Run the :ref:`dev-server` in an emacs buffer [C-c C-p r]
* Jump to current project in browser (start server if required) [C-c C-p b]
* Run test case at point in buffer [C-c C-p t]
* Run tests for current app in buffer [C-c C-p t]
* Run Syncdb on current project
* Management commands for current project in interactive buffer
* South integration - run south convert, schemamigration, migrate
* Run django shell in buffer [C-c C-p s]
  * Checks for shell_plus
  * If not defaults to shell
* Fabric integration [C-c C-p f]
* Startapp and dumpdata on current project within emacs
* Database integration with Emacs sql-mode interactive buffer [C-c C-c d
* Django Template minor mode with syntax highlighting for django template tags
* Snippet collection for django
* generate tags table for project
* run manage commands in interactive buffer
* Buildout integration
* Generate TAGS table for project to enable quick navigation
* Jump to template at point or from editing view [C-c C-p g t]
* Virtualenv integration

Installation
------------

How do I install Pony Mode?

:ref:`installation`

Features
--------

Pony Mode has at least more than 3 features that make working on your Django projects from Emacs easier:

.. toctree::
   :maxdepth: 2

   details

Configuration
-------------

Configuration options for Pony Mode

.. toctree::
   :maxdepth: 2

   configuration


Bugs
----

Pony-mode is under active development, so please report any bugs on the github issue tracker

Help
----
Turns out that there is a mailing list at https://groups.google.com/group/pony-mode .

Low frequency, high helpfulness. Feel free to stop by for helps & chats...


Licence
-------

Totally GPL

Roadmap
-------

Check the org-mode file pony.org for current todo/wish list

(If you can stand the org-to-github-markdown transition:
https://github.com/davidmiller/pony-mode/blob/master/pony.org )hs
