ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do

    end
    
    # Here is an example of a simple dashboard with columns and panels.
    # #
    columns do
      column do
        panel "Recent tweets" do
          ul do
            Tweet.all.map do |tweet|
              li link_to(tweet.content, admin_tweet_path(tweet))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
