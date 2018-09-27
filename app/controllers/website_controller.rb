class WebsiteController < ApplicationController

  def index

    @structure = {

    }

    @menu_structure = [
      {
        title: "Standard File",
        pages: [
          {
            title: "Self hosting Standard File",
            template: "standard-file/_self-hosting-standard-file"
          }
        ]
      },
      {
        title: "Extensions",
        pages: [
          {
            title: "Self hosting Standard File",
            template: "standard-file/_self-hosting-standard-file"
          }
        ]
      }
    ]

  end

end
