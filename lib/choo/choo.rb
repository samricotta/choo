require "../choo/choo/version"
require 'terminfo'
require "curses"
include Curses

module  Choo
  # module Choo
    # class Error < StandardError; end
    class Train

      def choo
        @string = "\r"
        @front = "🚂 "
        @carriage = "🚃 "
        move_right
      end

      def move_right
        print add_character(@front)
        loop do
          screen_size = TermInfo.screen_size
          if @string.length >= (screen_size[1] - 5)
              @string = "\r"
              print add_character(@front)
          else
            if @string.length < 10
              print @string
              add_character(@carriage)
              pause
            else
              print @string
              add_character(" ")
              pause
            end
          end
        end
      end

      def add_character(subject)
        @string.insert(0, subject)
      end

      def pause
        sleep(0.025)
      end

    end
  Train.new.choo
end

