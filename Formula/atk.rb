class Atk < Formula
  desc "GNOME accessibility toolkit"
  homepage "https://library.gnome.org/devel/atk/"
  url "http://ftp.gnome.org/pub/GNOME/sources/atk/2.14/atk-2.14.0.tar.xz"
  sha256 "cb41feda7fe4ef0daa024471438ea0219592baf7c291347e5a858bb64e4091c"

  #depends_on "gobject-introspection" => :build
  #depends_on "meson" => :build
  #depends_on "ninja" => :build
  #depends_on "pkg-config" => :build
  #depends_on "glib"

#  def install
#    mkdir "build" do
#      system "meson", "--prefix=#{prefix}", ".."
#      system "ninja"
#      system "ninja", "install"
#    end
#  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <atk/atk.h>
      int main(int argc, char *argv[]) {
        const gchar *version = atk_get_version();
        return 0;
      }
    EOS
    gettext = Formula["gettext"]
    glib = Formula["glib"]
    flags = %W[
      -I#{gettext.opt_include}
      -I#{glib.opt_include}/glib-2.0
      -I#{glib.opt_lib}/glib-2.0/include
      -I#{include}/atk-1.0
      -L#{gettext.opt_lib}
      -L#{glib.opt_lib}
      -L#{lib}
      -latk-1.0
      -lglib-2.0
      -lgobject-2.0
      -lintl
    ]
    system ENV.cc, "test.c", "-o", "test", *flags
    system "./test"
  end
end
