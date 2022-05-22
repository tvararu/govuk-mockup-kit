require "./lib/zip_file_generator"

REPO = "https://github.com/x-govuk/govuk-prototype-rig".freeze
CLONE = "tmp/rig".freeze

class ExportCommand < Rails::Command::Base
  include Thor::Actions # https://www.rubydoc.info/gems/thor/Thor/Actions

  source_root File.expand_path("../../lib/templates/rig", __dir__)

  desc "export", "Export a journey as a govuk-prototype-rig project"
  # TODO: Usage
  def export(journey_id, destination = nil)
    require_application_and_environment!

    git_clone
    set_journey(journey_id)

    if destination
      reuse_export(destination)
    else
      new_export(journey_id)
      cp_new_folder
      git_rm_remote
    end

    set_destination_folder
    update_service_name
    add_start_page

    unless destination
      zip_it_up
      save_to_database
    end
  end

  private

  def set_journey(id)
    @journey = Journey.find(id)
  end

  def new_export
    last_version = @journey.exports.order(created_at: :asc).last&.version || 0
    @export = @journey.exports.new
    @folder = "tmp/journey-#{@journey.id}-v#{last_version + 1}"
    @export.name = "#{@folder}.zip"
  end

  def reuse_export(existing_folder)
    @folder = existing_folder
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

  def set_destination_folder
    self.destination_root = @folder
  end

  def update_service_name
    gsub_file "package.json", "Your service name", @journey.title
  end

  def add_start_page
    template "app/views/start.html"
    gsub_file "app/views/index.html",
              "startButton: {\n      href: \"#\"",
              "startButton: {\n      href: \"/start\""
  end

  def zip_it_up
    ZipFileGenerator.new(@folder, @export.name).write
  end

  def save_to_database
    @export.data = File.read(@export.name)
    @export.save!
  end
end
