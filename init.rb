require 'redmine'

Redmine::Plugin.register :redmine_orphan_revisions do
  name 'Orphan Revisions'
  author 'Alex Tsirel'
  description 'Show not linked revisions'
  version '0.0.2'
  url 'https://github.com/noma4i/Redmine-Orphan-Revisions'
  author_url 'https://github.com/noma4i'

  project_module :orphan_revisions do
    permission :orphan_revisions, { :orphan_revisions => [:show_orphan_revisons] },:public => true
  end
end
