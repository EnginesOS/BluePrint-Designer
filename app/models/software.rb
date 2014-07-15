class Software < ActiveRecord::Base
 has_one :swframeworks
 has_one :langauge
 belongs_to :owner
 has_one :license
 has_one :softwaredeploytype
 has_many :softwareservices
 has_many :persistantdirs , dependent: :destroy
 has_many :replacementstrings, dependent: :destroy
 has_many :persistantfiles, dependent: :destroy
 has_many :installedpackages, dependent: :destroy
 has_many :ospackages, dependent: :destroy
 has_many :cron_jobs, dependent: :destroy
 validates :name, presence:true, length: { minimum: 5}
 validates :description, presence:true, length: { minimum: 15}

end

