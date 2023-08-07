import os

fn main() {

  mut waybar := os.new_process('/usr/local/bin/waybar')

  waybar.run()

//  for waybar.is_alive() {
//    line := waybar.stdout_read()
//    println('stdout: ${line}')
//  }

}
