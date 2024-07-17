class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    # options = {}
    # available_option_keys = [:first_option, :second_option, :third_option]
    # all_keys = params.keys.map(&:to_sym)
    # set_option_keys = all_keys & available_option_keys
    # set_option_keys.each do |key|
    #   options[key] = params[key]
    # end
    # options

    # Because Symbol objects in Ruby are not garbage collected, it is dangerous to convert user supplied parameters to symbols.
    # An attacker could send a series of requests with random keys that would be turned into symbols, quickly exhausting
    # your server's available memory and taking down your site.

    # There are two ways that this could could be fixed. The first would be to use slice to eliminate values from the params
    # hash that are not valid option keys. This would look something like:

    # params.slice(available_option_keys).each do |key|
    #   options[key] = params[key]
    # end

    @ticket = Ticket.find(params[:id])
    coordinates =  @ticket.well_known_text
    @coordinates = Ticket.convert_polygon(coordinates)
    @sample_coordinates = @coordinates.sample

    # @coordinates = [ [ 156922.3097, 6559238.263 ], [ 157424.9655, 6559462.937 ], [ 157837.7369, 6559395.169 ], [ 158078.2783, 6559284.668 ] ]
  end

  # def users_comments
  #   posts = Post.all
  #   comments = posts.map(&:comments).flatten
  #   @user_comments = comments.filter do |comment|
  #     comment.author.username == params[:username]
  #   end
  # end

  # This is a classic example of an "n+1" bug. The first line will retrieve all of the Post objects from the database,
  # but then the very next line will make an additional request for each Post to retrieve the corresponding Comment objects.
  # To make matters worse, this code is then making even more database requests in order to retrieve the Author of each Comment.

  # This can all be avoided by changing the first line in the method to:

  # posts = Post.includes(comments: [:author]).all

  # This will tell ActiveRecord to perform a database join between the tables for Post, Comment, and Author,
  # reducing the number of database requests to just one.
end
