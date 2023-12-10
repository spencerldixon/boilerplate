class SitemapRefreshJob < ApplicationJob
  def perform
    Rake::Task["sitemap:refresh"].invoke
  end
end
