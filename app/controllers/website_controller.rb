class WebsiteController < ApplicationController

  before_action {
    build_menu
  }

  def index

  end


  def template
    path = params[:path]
    root_path = "website/templates"

    @menu_structure.each do |section|
      section[:pages].each do |page|
        if page[:path] == path
          @template_path = "#{root_path}/#{page[:template]}"
          @title = page[:title]
        end
      end
    end

  end

  private

  def build_menu
    @menu_structure = [
      {
        title: "Standard File",
        pages: [
          {
            title: "Self Hosting with EC2 and Nginx",
            template: "standard-file/ec2-nginx.html"
          },
          {
            title: "Self Hosting with Docker",
            template: "standard-file/docker.html"
          },
        ]
      },
      {
        title: "Extensions",
        pages: [

        ]
      }
    ]

    compute_paths_for_structure(@menu_structure)
  end

  def compute_paths_for_structure(structure)
    structure.each do |section|
      section[:pages].each do |page|
        path = "#{section[:title].parameterize}/#{page[:title].parameterize}"
        page[:path] = path
      end
    end
  end


end
