class Picture < ApplicationRecord
  belongs_to :user
  has_many :events

  acts_as_votable
  validates :title, :presence => true

  has_attached_file :image, styles: { medium: "350x350>" }, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  before_save :tileize_picture
  def tileize_picture
    self.title = self.title.titleize
  end

  def get_task
    begin
      url = "https://api.deepomatic.com/v0.6/detect/fashion/?url=#{self.image.url}"
      puts url
    response = RestClient::Request.new(
      :method => :get,
      :url => url,
      :headers => {
        'X-APP-ID' => ENV['DEEPID'],
        'X-API-KEY' => ENV['DEEPKEY']
      }
    ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      throw(:abort) #helping it not crash if it fails to save
    end
    JSON.parse(response)["task_id"].to_i
  end

  def get_details
    begin
    response = RestClient::Request.new(
      :method => :get,
      :url => "https://api.deepomatic.com/v0.6/tasks/" + self.task_id.to_s,
      :headers => {
        'X-APP-ID' => ENV['DEEPID'],
        'X-API-KEY' => ENV['DEEPKEY']
      }
    ).execute
    rescue RestClient::BadRequest => error
      errors.add(:base, message)
      throw(:abort)
    end
    JSON.parse(response)
  end
end
