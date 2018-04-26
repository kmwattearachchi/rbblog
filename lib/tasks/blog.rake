namespace :blog do
  desc "Run monthly report"
  task :send_daily_newsletter => :environment do

    subscriber_list = Subscriber.all

    subscriber_list.each do |subscriber|
      puts subscriber.email
    end

    require 'mail'

    options = { :address              => "smtp.gmail.com",
                :port                 => 587,
                :domain               => 'your.host.name',
                :user_name            => 'kalana@intervest.lk',
                :password             => 'kalanaintervest',
                :authentication       => 'plain',
                :enable_starttls_auto => true  }


    Mail::ContentTypeField.new("text/html") #this doesnt work

    Mail.defaults do
      delivery_method :smtp, options
    end

    Mail.deliver do
      to 'kmwattearachchi@gmail.com'
      from 'ada@test.lindsaar.net'
      subject 'testing sendmail'
      content_type 'text/html; charset=UTF-8'
      body getNewsletterMailBody
    end

    puts "Generate TPS report CSV..."

    # Keep data for the current month only
    #Logger.new('this_month.log', 'monthly')
    # Keep data for today and the past 20 days.
    # Start the log over whenever the log exceeds 100 megabytes in size.
    #Logger.new('application.log', 0, 100 * 1024 * 1024)
  end

  private

  def getNewsletterMailBody
    posts = BlogArticle.where("Date(created_at) = ?","2018-04-18")
    ac = ActionController::Base.new()
    body = ac.render_to_string(:template => 'newsletter/newsletter', :locals => { :@posts => posts })
    return body
  end
end
