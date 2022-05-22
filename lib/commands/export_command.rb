require "./lib/zip_file_generator"

REPO = "https://github.com/x-govuk/govuk-prototype-rig".freeze
CLONE = "tmp/rig".freeze
EXPORT = "tmp/prototype-v1".freeze
OUTZIP = "tmp/prototype-v1.zip".freeze

class ExportCommand < Rails::Command::Base
  include Thor::Actions

  desc "export", "Export a journey as a govuk-prototype-rig project"
  # TODO: Usage
  def export(journey_id)
    require_application_and_environment!

    find_journey(journey_id)
    git_clone
    cp_new_folder
    git_rm_remote
    update_service_name
    zip_it_up
  end

  private

  def find_journey(id)
    @journey = Journey.find(id)
  end

  def git_clone
    system "git clone --depth=1 #{REPO} #{CLONE}" unless File.exist? CLONE
  end

  def cp_new_folder
    system "cp -r #{CLONE} #{EXPORT}" unless File.exist? EXPORT
  end

  def git_rm_remote
    system "cd #{EXPORT} && git remote rm origin >/dev/null 2>&1"
  end

  def update_service_name
    gsub_file "#{EXPORT}/package.json", "Your service name", @journey.title
  end

  def zip_it_up
    remove_file OUTZIP
    zf = ZipFileGenerator.new(EXPORT, OUTZIP)
    zf.write
  end
end
