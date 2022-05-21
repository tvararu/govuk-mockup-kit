REPO = "https://github.com/x-govuk/govuk-prototype-rig".freeze
EXPORT = "tmp/prototype-v1".freeze

class ExportCommand < Rails::Command::Base
  include Thor::Actions

  desc "export", "Export a journey as a govuk-prototype-rig project"
  # TODO: Usage
  def export(journey_id)
    require_application_and_environment!
    @journey = Journey.find(journey_id)

    git_clone
    cp_new_folder
    git_rm_remote
    update_service_name
  end

  private

  def git_clone
    system "git clone #{REPO} tmp/rig" unless File.exist? "tmp/rig"
  end

  def cp_new_folder
    system "cp -r tmp/rig #{EXPORT}" unless File.exist? EXPORT
  end

  def git_rm_remote
    system "cd #{EXPORT} && git remote rm origin >/dev/null 2>&1"
  end

  def update_service_name
    gsub_file "#{EXPORT}/package.json", "Your service name", @journey.title
  end
end
