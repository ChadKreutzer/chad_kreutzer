get '/' do
    @projects = Project.all
    erb :index
  end

  post '/' do
    require 'pony'
  
    name  = params[:name]
    mail = params[:mail]
    subject = params[:subject]
    body  = params[:body]
    
    Pony.mail({ to:'chadkreutzer@outlook.com',
                subject: "#{subject}",
                body: "#{name}\n#{mail}\n\n#{body}",
                via: :smtp,
                via_options: {
                  address:              'smtp.gmail.com',
                  port:                 '587',
                  enable_starttls_auto: true,
                  user_name:            ENV["GMAIL_USERNAME"],
                  password:             ENV["GMAIL_PASSWORD"],
                  authentication:       :plain, # :plain, :login, :cram_md5, no auth by default
                  domain:               "localhost.localdomain" # the HELO domain provided by the client to the server
                }
              })
  
   # Look into figaro gem for .gitignore.
  
    redirect '/#contact'
  end
