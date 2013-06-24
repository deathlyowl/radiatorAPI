class ReportsMailer < ActionMailer::Base
  default from: "radiator@deathlyowl.com"
  default to: "pawel@ksienie.com"
  
  def report_mail(station_id)
      @station = Station.find(station_id)
      @url  = "http://example.com/login"
      mail(:subject => "Welcome to My Awesome Site")
    end
end
