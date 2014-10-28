class Comment < Connect
  attr_reader :id, :text

  def initialize(comments_json)
    @id = comments_json["id"]
    @text = comments_json["text"]
  end

  def self.get_comments(project_id, story_id)
    conn = set_connections
    conn.headers["X-TrackerToken"]=ENV["TRACKER_TOKEN"]
    response = conn.get "services/v5/projects/#{project_id}/stories/#{story_id}/comments"
    response.body
  end

  def self.all(project_id, story_id)
    comments_json = JSON.parse(get_comments(project_id,story_id))
    comments_json.map do |comment_json|
      Comment.new(comment_json)
    end
  end

end