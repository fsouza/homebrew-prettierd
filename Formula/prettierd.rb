require "language/node"

class Prettierd < Formula
  desc "prettier, on SPEED!"
  homepage "https://github.com/fsouza/prettierd"
  url "https://registry.npmjs.org/@fsouza/prettierd/-/prettierd-0.22.2.tgz"
  sha256 "faa5bfac8b6eb0a783a506191db72a6df22baedcefad8515f7f624f9ab3c7764"
  license "ISC"
  head "https://github.com/fsouza/prettierd.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/prettierd"]
  end

  test do
    output = pipe_output("#{bin}/prettierd test.js", "const arr = [1,2];", 0)
    assert_equal "const arr = [1, 2];", output.chomp
  end
end

