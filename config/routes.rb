RedmineApp::Application.routes.draw do
  get "show_orphan_revisons/:project_id/:version/:from/:to", :to => "redmine_orphan_revisions#show_orphan_revisons", :as => "orphan_revisions"
end