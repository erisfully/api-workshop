class Project < Connect

  attr_reader :name, :id

  def initialize(project_json)
    @name = project_json["name"]
    @id = project_json["id"]
  end

  def self.get_projects
    conn = set_connections
    conn.headers["X-TrackerToken"]=ENV["TRACKER_TOKEN"]
    response = conn.get 'services/v5/projects'
    response.body
  end

  def self.all
    projects_json = JSON.parse(get_projects)
    projects_json.map do |project_json|
      Project.new(project_json)
    end
  end
end