class Fetchmail < Formula
  desc "Client for fetching mail from POP, IMAP, ETRN or ODMR-capable servers"
  homepage "https://www.fetchmail.info/"
  url "https://downloads.sourceforge.net/project/fetchmail/branch_6.4/fetchmail-6.4.16.tar.xz"
  sha256 "044b9a0ac03afbae7744979defe3e2e32e39141bca68fd0c8deda2ed40884fb9"

  livecheck do
    url :stable
    regex(%r{url=.*?/branch_\d+(?:\.\d+)*?/fetchmail[._-]v?(\d+(?:\.\d+)+)\.t}i)
  end

  bottle do
    sha256 cellar: :any, arm64_big_sur: "6082dc2d97f2491c506c7ba33a3cf01846bdd4b41a9a55a5f19e1e744359e3d6"
    sha256 cellar: :any, big_sur:       "d7273ebce1199d8c93715aae1df086a5c95bbe44aefe235b1f4c7615ec57c02a"
    sha256 cellar: :any, catalina:      "d271ef06226fad2f08bc345302f4d355b5e45807f65f7a91f7ae453070b13ba8"
    sha256 cellar: :any, mojave:        "a7228da25a61aa7d9aec8f3b83ecb7d2ff44133a850ed36310832de1a2dbe275"
  end

  depends_on "openssl@1.1"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-ssl=#{Formula["openssl@1.1"].opt_prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/fetchmail", "--version"
  end
end
