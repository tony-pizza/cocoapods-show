module Pod
  class Command
    class Show < Command

      self.summary = 'List installed pods'
      self.description = <<-DESC
        Lists pods and their versions installed in the current project.

        If optional `POD_NAME` provided the results will be filtered to
        matching pods.
      DESC
      self.arguments = [
        CLAide::Argument.new('POD_NAME', false)
      ]

      attr_reader :filter

      def initialize(argv)
        @filter = argv.shift_argument
        super
      end

      def run
        verify_lockfile_exists!
        section_title = "Installed pods"
        section_title += " matching '#{filter}'" if filter
        UI.section("#{section_title}:") do
          config_hash = config.lockfile.to_hash
          config_hash['PODS'].each do |pod|
            pod = pod.keys.first if pod.is_a?(Hash)
            next if filter && pod.scan(filter).empty?
            pod_name, version = Specification.name_and_version_from_string(pod)
            if config_hash['CHECKOUT OPTIONS']
              pod_source = config_hash['CHECKOUT OPTIONS'][pod_name]
              if pod_source && pod_source[:commit]
                git_version = pod_source[:commit][0,7]
                version = "#{version} #{git_version}"
              end
            end
            UI.puts "  * #{pod_name} (#{version})"
          end
        end
      end

    end
  end
end
