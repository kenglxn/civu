#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'

program :version, '0.0.1'
program :description, 'a simple ruby gem for cloning git repos from jenkins views'

command :list do |c|
  c.syntax = 'junkie list [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    # Do something or c.when_called Junkie::Commands::List
  end
end

