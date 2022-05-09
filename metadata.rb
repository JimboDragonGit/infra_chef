name 'infra_chef'
maintainer 'Jimbo Dragon'
maintainer_email 'jimbo_dragon@hotmail.com'
license 'MIT'
description 'Installs/Configures infra_chef'
version '0.1.1'
chef_version '>= 16.6.14'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/jimbodragon/infra_chef/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/jimbodragon/infra_chef'

supports ubuntu
supports debian

depends 'infraClass'
depends 'chef_workstation_initialize'
