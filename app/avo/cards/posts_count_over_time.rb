class PostsCountOverTime < Avo::Dashboards::ChartkickCard
  self.id = "posts_count_over_time"
  self.label = "Posts count over time"
  self.chart_type = :area_chart
  # Other chart_type options can be: line, bar
  # self.description = "Some tiny description"
  self.cols = 2
  # self.initial_range = 30
  # self.ranges = {
  #   "7 days": 7,
  #   "30 days": 30,
  #   "60 days": 60,
  #   "365 days": 365,
  #   Today: "TODAY",
  #   "Month to date": "MTD",
  #   "Quarter to date": "QTD",
  #   "Year to date": "YTD",
  #   All: "ALL",
  # }
  # self.chart_options = { library: { plugins: { legend: { display: true } } } }
  # self.flush = true

  def query
    result [
      { name: "Posts count over time", data: {
        May: Post.where(created_at: (Time.now - 1.month)..).count,
        April: Post.where(created_at: (Time.now - 2.month)..).count,
        March: Post.where(created_at: (Time.now - 3.month)..).count,
      } },
    ]
  end
end
