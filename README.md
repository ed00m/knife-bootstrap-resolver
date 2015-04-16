knife-bootstrap-resolver
========================

Chef knife plugin to configure the DNS resolver(s) on a node during bootstrap.

Sometimes a newly provisioned server may not have the correct DNS resolver configuration (either from template or DHCP) which causes `knife bootstrap` to fail - this plugin aims to solve that issue but providing an option a provisioning template can use to set the resolver before attempting to install the Chef client using the install.sh.

```
$ knife bootstrap -h | grep -i resolver
        --bootstrap-resolver RESOLVER
                                     The DNS resolver for the node being bootstrapped
```

### Configuration

To configure DNS resolver options in your `knife.rb`, add:

```
knife[:bootstrap_resolver]   = [ "8.8.8.8", "8.8.4.4" ]
```

To specify the above options on the fly, use the `--bootstrap-resolver` option to set the bootstrap node's resolver.

### Bootstrap Template

To make use of the above, include the following snippet towards the top in your bootstrap template (before any attempts to download files):

```
<% if @config[:bootstrap_resolver] -%>
<% @config[:bootstrap_resolver].map!(&:strip) if @config[:bootstrap_resolver].is_a?(Array) %>
<% @config[:bootstrap_resolver].is_a?(Array) ? bootstrap_resolver = @config[:bootstrap_resolver].join(" ") : bootstrap_resolver = @config[:bootstrap_resolver] %>
bootstrap_resolver=( <%= bootstrap_resolver %> )
for n in "${bootstrap_resolver[@]}"; do echo "nameserver ${n}"; done > /etc/resolv.conf
<% elsif @knife_config[:bootstrap_resolver] -%>
<% @knife_config[:bootstrap_resolver].map!(&:strip) if @knife_config[:bootstrap_resolver].is_a?(Array) %>
<% @knife_config[:bootstrap_resolver].is_a?(Array) ? bootstrap_resolver = @knife_config[:bootstrap_resolver].join(" ") : bootstrap_resolver = @knife_config[:bootstrap_resolver] %>
bootstrap_resolver=( <%= bootstrap_resolver %> )
for n in "${bootstrap_resolver[@]}"; do echo "nameserver ${n}"; done > /etc/resolv.conf
<% end -%>
```

### Attributes

Knife attributes for `knife.rb`.  Options specified when running `knife bootstrap` take precedence over those options specified in your `knife.rb`.

###### bootstrap_resolver
Here you specify the DNS resolvers for your node to use.<br>
Multiple entries should be specified as an array.

