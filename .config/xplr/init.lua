version = '0.21.3'

local plug_dir = os.getenv('HOME') .. '/.config/xplr/plugins/'

package.path =
   plug_dir
.. 'material-landscape2.xplr/init.lua;'
.. package.path

require 'material-landscape2'.setup()
