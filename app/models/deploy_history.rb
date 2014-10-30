class DeployHistory
  include Mongoid::Document
  field :name, type: String
  field :user_id, type: String
  field :history, type: String
  field :started_at, type: DateTime
  field :ended_at, type: DateTime
  field :status, type: String, default: "Initiated"

  field :release, type: String
  field :target_config_name, type: String
  field :mode, type: String
  field :comments, type: String


  before_save :perform_deployment


  private
  
  # perl fetch_and_deploy.pl -r ese-force-3.45 -d <target.config> --mode=ops
  def perform_deployment
  	self.started_at = Time.now  	
  	line = Cocaine::CommandLine.new("cd /home/mohkhan.Desktop/SFDC_DeplomentScripts && perl fetch_and_deploy.pl -r #{self.release} -d <#{self.target_config_name}> --mode=#{self.mode}")
  	line.run
  	self.ended_at = Time.now
  	self.status = "deployed"
  	self.save
  end 	



end
