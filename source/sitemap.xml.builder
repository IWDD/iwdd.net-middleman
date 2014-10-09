xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9", "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance" do
  sitemap.resources.each do |resource|
    xml.url do
      xml.loc "http://www.iwdd.net#{resource.url}"
      if resource.url == '/' && resource.destination_path == 'index.html'
        xml.lastmod File.mtime('data/iwdd.yml').iso8601
      else
        xml.lastmod File.mtime(resource.source_file).iso8601
      end
    end if resource.destination_path =~ /\.html$/
  end
end
