require 'terminfo'

require "../choo/choo/version"
require "../choo/choo/terminal"
require "../choo/choo/train"

module Choo
  Train.new(10).choo
end
