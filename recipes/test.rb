print "Hi #{node['firstname']['surname']} you wrote ur first attribute\n"
print "partition is #{node[:partition]} ....\n"

execute 'diskpartitionscript' do

  command "/root/diskpartition.exp /dev/#{node[:partition]}"
  not_if { "#{node[:partition]}1"  }

end
