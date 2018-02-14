#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# here similarly we are calling the 
# server recipe from default recipe in 
# using <includ_recipe> syntax

include_recipe "apache::server"

#default[:firstname]='arun'
#default[:lastname]='kumar'
