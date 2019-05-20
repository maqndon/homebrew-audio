class Aubio < Formula
  desc "Extract annotations from audio signals"
  homepage "https://aubio.org/"
  url "http://aubio.org/pub/aubio-0.3.2.tar.gz"
  sha256 "d48282ae4dab83b3dc94c16cf011bcb63835c1c02b515490e1883049c3d1f3da"

  #depends_on "libtool" => :build
  #depends_on "pkg-config" => :build
  #depends_on "numpy"
  #depends_on "python"

  def install
    # Needed due to issue with recent clang (-fno-fused-madd))
    ENV.refurbish_args

    system "python3", "./waf", "configure", "--prefix=#{prefix}"
    system "python3", "./waf", "build"
    system "python3", "./waf", "install"

    system "python3", *Language::Python.setup_install_args(prefix)
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/aubiocut", "--verbose", "/System/Library/Sounds/Glass.aiff"
    system "#{bin}/aubioonset", "--verbose", "/System/Library/Sounds/Glass.aiff"
  end
end
