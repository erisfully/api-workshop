class Story < Connect

  attr_reader :name, :id

  def initialize(project_json)
    @name = project_json["name"]
    @id = project_json["id"]
  end

  def self.get_stories(project_id)
    conn = set_connections
    conn.headers["X-TrackerToken"]=ENV["TRACKER_TOKEN"]
    response = conn.get "services/v5/projects/#{project_id}/stories"
    response.body
  end

  def self.find(id)
    projects_json = JSON.parse(get_stories(id))
    projects_json.map do |story_json|
      Story.new(story_json)
    end
  end


end