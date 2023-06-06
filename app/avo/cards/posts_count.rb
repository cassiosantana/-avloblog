class PostsCount < Avo::Dashboards::MetricCard
  self.id = "posts_count"
  self.label = "Posts count"
  # self.description = "Some description"
  # self.cols = 1
  self.initial_range = 30
  self.ranges = {
    "7 days": 7,
    "30 days": 30,
    "60 days": 60,
    "365 days": 365,
    Today: "TODAY",
    "Month to date": "MTD",
    "Quarter to date": "QTD",
    "Year to date": "YTD",
    All: "ALL",
  }
  # self.prefix = ""
  # self.suffix = ""

  def query
    from = nil

    if range.present?
      if range.to_s == range.to_i.to_s
        from = Time.now - range.to_i.days
      else
        case range
        when "TODAY"
          from = Time.now.beginning_of_day
        when "MTD"
          from = Time.now.beginning_of_month
        when "QTD"
          from = Time.now.beginning_of_quarter
        when "YTD"
          from = Time.now.beginning_of_year
        when "ALL"
          from = Time.at(0)
        end
      end
    end

    if from
      result Post.where(created_at: from..).count
    else
      result Post.count
    end
  end
end
