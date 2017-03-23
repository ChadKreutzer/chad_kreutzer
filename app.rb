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
end
