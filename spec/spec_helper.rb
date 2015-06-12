$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'large_file_linux'

FOUR_GB    = 4_294_967_296 # 4 * 1024 * 1024 * 1024
INT32_MAX  = 2_147_483_647 # 2 * 1024 * 1024 * 1024 - 1
EXTRA_DATA = "abcdefghijklnopqrstuvwxyz0123456789"
TOTAL_SIZE = FOUR_GB + EXTRA_DATA.length + 1 # + 1 for the trailing \n

def create_large_file
  require 'tempfile'
  File.join(Dir.tmpdir, "test_large_file").tap do |path|
    `truncate --size #{FOUR_GB} "#{path}"`
    `echo "#{EXTRA_DATA}" >> "#{path}"`
  end
end

def seek_to_extra_data(lf)
  # LargeFileLinux expects to be run on a 32 bit Linux, where int is 32 bit.
  #   Thus, we can only seek INT32_MAX at most if we are testing on a 64 bit
  #   machine.
  lf.seek(0, IO::SEEK_SET)
  2.times do
    lf.seek(INT32_MAX, IO::SEEK_CUR)
    lf.seek(1, IO::SEEK_CUR)
  end
end
