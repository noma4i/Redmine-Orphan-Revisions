class RedmineOrphanRevisionsController < ApplicationController
  unloadable

  def show_orphan_revisons
    @project = Project.find(params[:project_id])
    @version = Version.find(params[:version])

    issues_in_release = @version.fixed_issues.map(&:id).join(',')

    if issues_in_release.size > 0
      @revisions = Changeset.where("committed_on > ? and committed_on < ?",params[:from],params[:to]).joins("left join changesets_issues ci on ci.changeset_id = changesets.id").where("ci.issue_id is null or ci.issue_id not in (#{issues_in_release})")
    end

    render 'revisions'
  end
end