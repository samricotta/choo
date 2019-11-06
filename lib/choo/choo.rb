require "../choo/choo/version"

module  Choo
  # module Choo
    # class Error < StandardError; end
    class Train
      def self.choo
        first_loop
      end

      def self.first_loop
        string = " "
        front = "🚂"
        carriage = " 🚃 "
        all_c = " 🚃 🚃 🚃 🚃 🚃"
        print string.insert(-1, front)
          sleep(0.5)
        loop do
          print string
          string.insert(-1, carriage)
          sleep(0.5)
          string.insert(-1, carriage)
          sleep(0.5)
        end
        # all.slice!(0)
        # p all
        # end
      end
      choo
    end
  # end
end


 # 1.upto(6) do |i|
 #            print front
 #            sleep(0.5)
 #            p
