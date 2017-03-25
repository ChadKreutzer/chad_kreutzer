require 'sinatra/base'

class MyApp < Sinatra::Base
  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end
  
  get '/' do
    @projects = Project.all
    erb :index
  end
  
  post '/' do
  
    name  = params[:name]
    mail = params[:mail]
    subject = params[:subject]
    body  = params[:body]
      
    Pony.mail({ to:'chadkreutzer@outlook.com',
                subject: "#{subject}",
                body: "#{name}\n#{mail}\n\n#{body}",
                via: :smtp,
                via_options: {
                  address:              'smtp.sendgrid.net',
                  port:                 '587',
                  enable_starttls_auto: true,
                  user_name:            ENV['SENDGRID_USERNAME'],
                  password:             ENV['SENDGRID_PASSWORD'],
                  authentication:       :plain,
                  domain:               "localhost.localdomain" 
                }
              })
    
    redirect '/#contact'
  end
  
  get "/blog/?*" do
    main_site = Regexp.new('/^\/#/')
    blog_page = params['splat'].first
    if blog_page.blank?
      send_file "jekyll_blog/_site/index.html"
    elsif  main_site === blog_page
      redirect blog_page
    else
      send_file "jekyll_blog/_site/#{blog_page}"
    end
  end

end
