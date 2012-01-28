What?
=====

A plugin for Oldskool that renders the internal documentation found in Puppet Types

Configuration?
--------------

To activate this plugin in you Oldskool install just add it to the Gemfile, to
have a specific version of Puppet used as reference source add this to the Gemfile:

    gem 'puppet', "2.6.9"
    gem 'oldskool-puppet', '>= 0.0.3'

Once the plugin is activated create a keyword in your _oldskool.yaml_:

    - :type: :puppet
      :keywords: puppet

Contact?
--------

R.I.Pienaar / rip@devco.net / @ripienaar / http://devco.net/
