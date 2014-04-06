# `chef-exchange`

## Abstract

Bash script to migrate or backup a Chef Server by using it's live data
exported to local file-system. It can download from Chef Server -- including
environment, nodes, roles, cookbooks and data-bags -- and then upload towards
another server for instance.

#### The Dangers of Knife

All together with this project you may find a `knife` tool without any
plugins or checks for Git repositories and such. During export and import you
don't want to have any checks along the way, since it's a backup or migration
tool.

## Chef Data

The following entities will be configured during download and upload, they
directly related to knife sub-commands and therefor implement specific ways to
import (or upload) those entities. Whenever possible `JSON` format will be
employed, although for cookbook and data-bags they will be considered as
directories. Also the same sequence documented here will be applied by this
script.

Data will be stored and looked for under `--basedir` informed directory, they
also follow the same entities name (with lowered capitals) to create
underneath data structure. Every piece of data rewritten will also produce a
warning to standard error output.

* Environment: <`--basedir`>/environment;
* Role: <`--basedir`>/role;
* Nodes: <`--basedir`>/node;
* Cookbook: <`--basedir`>/cookbook;
* Data-bag: <`--basedir`>/data_bag;

## Usage Examples

Usage examples of this tool, after configuring required information (username,
keys, server address):

#### Download

    $ ./chef-exchange                       \
       --download                           \
       --knife   $PWD/bin/knife             \
       --kniferb $HOME/.chef/knife.rb       \
       --basedir $PWD/data/

#### Upload

    $ ./chef-exchange                       \
       --upload                             \
       --knife   $PWD/bin/knife             \
       --kniferb $PWD/etc/knife_example.rb  \
       --basedir $PWD/data/

## Command-line Options

#### `--download` or `--upload`:

Control the action of this tool towards a Chef-Server;

##### `--basedir`:

Where it will drop or look for the Chef data converted to `JSON` format;

##### `--knife`:

Path to knife command (Ruby executable file);

##### `--kniferb`:

Configuration file for knife command, tells on which Chef-Server to connect,
proxy to use and where to find cookbooks. Important carefully review this
configuration before any run.

##### `--help` or `-h`:

Displays help message.
