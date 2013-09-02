.. _details:

Pony Mode Details
=================

Pony Mode has at least more than twelve features for helping you work on your Django projects from Emacs

.. _dev-server:

Development server
------------------

The command::

    M-x pony-runserver

(Which is bound by default to C-c C-p r) Will start the dev server for your current project

Pony Mode will check to see if runserver_plus is available, and will prefer to use that, falling back to the basic Django runserver.

You can configure the :ref:`pony-server-host` and :ref:`pony-server-port` your server runs on by configuring the custom variables.

Fabric Integration
------------------

Pony mode will interact with fabric for your current project, building a list of functions to auto-complete, and running commands within a \*fabric\* buffer.

Buildout Support
----------------

Pony mode is aware of buildout, and will use buildout-root/bin/django to
run management commands when available, manage.py when not.

The command M-x django-buildout will re-run buildout for your current project

M-x django-buildout-bin will run a script from your buildout's bin directory in an interactive buffer

Tags
----

Generate a TAGS table for your project with M-x django-tags
The exact command used is customisable through django-etags-command in
M-x customize-group RET django

Tests
-----

Run tests in in an interactive buffer, allowing you to drop out into ipdb/pdb
as required.

Tests will default to --failfast, but you can turn that off with the variable django-test-failfast or set it in
M-x customize-group django

in a test run buffer, C-c C-g will jump to the last file and line indicated by the traceback.

Virtualenv
----------

Pony-mode will check to see if your project is inside a virtualenv. If so, it will use the python
interpreter from the virtualenv to run all django-related management commands.

Virtualenv support assumes that you initialized the virtualenv with something equivalent to::

    $ virtualenv my-cool-project [--no-site-packages]

    $ cd my-cool-project

    $ django-admin.py startproject awzm

    $ source ./bin/activate

    $ cd awzm

    $ emacs settings.py

If your setup is different to this, then the implicit Virtualenv detection may fail.

Fear not though! - you can customise the interpreter used by Pony-mode with a pony-project.

