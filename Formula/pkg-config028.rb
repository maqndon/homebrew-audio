class pkg-config < Formula
  desc "pkg-config"
  homepage "https://www.freedesktop.org/wiki/Software/pkg-config/"
  url "http://pkgconfig.freedesktop.org/releases/pkg-config-0.28.tar.gz"
  sha256 "d3611d825de06ea099ef8bd422b28623299a7fe302a8e39ad10c0dd80cd1d622"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
