require "./lib/zip_file_generator"

REPO = "https://github.com/x-govuk/govuk-prototype-rig".freeze
CLONE = "tmp/rig".freeze

class ExportCommand < Rails::Command::Base
  include Thor::Actions

  desc "export", "Export a journey as a govuk-prototype-rig project"
  # TODO: Usage
  def export(journey_id)
    require_application_and_environment!

    new_export(journey_id)
    git_clone
    cp_new_folder
    git_rm_remote
    update_service_name
    zip_it_up
    save_to_database
  end

  private

  def new_export(id)
    @journey = Journey.find(id)
    last_version = @journey.exports.order(created_at: :asc).last&.version || 0
    @export = @journey.exports.new
    @folder = "tmp/journey-#{@journey.id}-v#{last_version + 1}"
    @export.name = "#{@folder}.zip"
  end

  def git_clone
    system "git clone --depth=1 #{REPO} #{CLONE}" unless File.exist? CLONE
  end

  def cp_new_folder
    system "cp -r #{CLONE} #{@folder}"
  end

  def git_rm_remote
    system "cd #{@folder} && git remote rm origin"
  end

  def update_service_name
    gsub_file "#{@folder}/package.json", "Your service name", @journey.title
  end

  def zip_it_up
    ZipFileGenerator.new(@folder, @export.name).write
  end

  def save_to_database
    @export.data = File.read(@export.name)
    @export.save!
  end
end
