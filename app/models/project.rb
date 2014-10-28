class Project

  attr_reader :name

  def initialize(project_json)
    @name = project_json["name"]
  end

  def find_by_name(name)
    
  end

  def self.get_projects

    conn = Faraday.new(:url => 'https://www.pivotaltracker.com') do |faraday|
      faraday.request :url_encoded # form-encode POST params
      faraday.response :logger # log requests to STDOUT
      faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
    end
    conn.headers["X-TrackerToken"]=ENV["TRACKER_TOKEN"]
    conn.headers["Accepts"]="application/xml"
    response = conn.get 'services/v5/projects' # GET http://sushi.com/nigiri/sake.json
    response.body

  end

  def self.all
    projects_json = JSON.parse(get_projects)
    projects_json.map do |project_json|
      Project.new(project_json)
    end
  end

end