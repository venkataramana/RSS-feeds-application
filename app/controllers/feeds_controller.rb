class FeedsController < ApplicationController
        require 'rubygems'
        require 'rexml/document'
        require 'pp'
        require 'rss'
        require 'open-uri'
        def index
              @feed=Feed.new
        end
        def create
                begin
                        url = params[:feed]["feed_name"]
                        content=""
                        open(url) do |s|
                                 content = s.read
                        end
                        rss = RSS::Parser.parse(content, false)
                        #rss = RSS::Parser.parse(open(url).read, false)
                        @rss=rss.items
                        @des=rss
                 rescue
                       render :text=> "Sorry #{params[:feed]["feed_name"].split}, you are not an RSS url. Plz check again" and return false
                end
        end
end

