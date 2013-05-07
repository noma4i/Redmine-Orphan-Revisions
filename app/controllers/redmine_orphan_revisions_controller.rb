class RedmineOrphanRevisionsController < ApplicationController
  unloadable

  def show_orphan_revisons
    @project = Project.find(params[:project_id])
    @version = Version.find(params[:version])

    issues_in_release = Issue.where(:fixed_version_id => @version.id).map(&:id).join(',') + "0"
    revisions = Changeset.where("committed_on > ? and committed_on < ?",params[:from],params[:to]).joins("left join changesets_issues ci on ci.changeset_id = changesets.id")

    if issues_in_release.size > 0
      @revisions_in_wrong_version = revisions.where("ci.issue_id is not null and ci.issue_id not in (#{issues_in_release})")
    end

    @orphan_revisions = revisions.where("ci.issue_id is null")

    render 'revisions'
  end
end