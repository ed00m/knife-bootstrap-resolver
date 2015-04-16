class Chef
  class Knife
    class Bootstrap < Knife

      option :bootstrap_resolver,
        :long => "--bootstrap-resolver RESOLVER",
        :description => "The DNS resolver for the node being bootstrapped",
        :proc => Proc.new { |r| Chef::Config[:knife][:bootstrap_resolver] = r }

    end
  end
end
