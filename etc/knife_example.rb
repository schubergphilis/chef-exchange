#### knife.rb ################################################################
# Example of configuration file to be informed on chef-exchange script, please
# consider each line replacing marked "<<>>" variables.
#
current_dir = File.dirname(__FILE__)

node_name "<<username>>"
client_key "#{current_dir}/<<username>>.pem"
validation_client_name "#{current_dir}/<<server>>-validator"
validation_key "#{current_dir}/<<server>>-validator.pem"
chef_server_url "https://chef.<<domain>>.com/organizations/<<server>>"
cookbook_path [ "#{current_dir}/../data/cookbook" ]
syntax_check_cache_path "/export/home/otaviof/tmp/chef-exchange/cache"

# http_proxy "http://<<proxy>>:3128"
# https_proxy "http://<<proxy>>:3128"
# knife[:bootstrap_proxy] = "http://<<proxy>>:3128"

# EOF
