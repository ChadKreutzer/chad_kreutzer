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
    jekyll_blog(request.path) {404}
  end
  
  def jekyll_blog(path, &missing_file_block)
    @current_menu = "blog"
    @title = "Crack in the Code"
  
    file_path = File.join(File.dirname(__FILE__), 'jekyll_blog/_site',  path.gsub('/blog',''))
    file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i  
  
    if File.exist?(file_path)
      file = File.open(file_path, "rb")
      contents = file.read
      file.close
  
      if (file_path.include?('.xml') || file_path.include?('.css'))
        erb contents, :content_type => 'text/xml'
      else
        erb contents, :layout_engine => :haml
      end
    else
      haml :not_found
    end
  end

end
