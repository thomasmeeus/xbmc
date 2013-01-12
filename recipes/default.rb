include_recipe "apt::default"
include_recipe "git::default"

%w{
  git-core
  build-essential
  gawk
  pmount
  libtool
  nasm
  yasm
  automake
  cmake
  gperf
  zip
  unzip
  bison
  libsdl-dev
  libsdl-image1.2-dev
  libsdl-gfx1.2-dev
  libsdl-mixer1.2-dev
  libfribidi-dev
  liblzo2-dev
  libfreetype6-dev
  libsqlite3-dev
  libogg-dev
  libasound2-dev
  python-sqlite
  libglew-dev
  libcurl3
  libcurl4-gnutls-dev
  libxrandr-dev
  libxrender-dev
  libmad0-dev
  libogg-dev
  libvorbisenc2
  libsmbclient-dev
  libmysqlclient-dev
  libpcre3-dev
  libdbus-1-dev
  libhal-dev
  libhal-storage-dev
  libjasper-dev
  libfontconfig-dev
  libbz2-dev
  libboost-dev
  libenca-dev
  libxt-dev
  libxmu-dev
  libpng-dev
  libjpeg-dev
  libpulse-dev
  mesa-utils
  libcdio-dev
  libsamplerate-dev
  libmpeg3-dev
  libflac-dev
  libiso9660-dev
  libass-dev
  libssl-dev
  fp-compiler
  gdc
  libmpeg2-4-dev
  libmicrohttpd-dev
  libmodplug-dev
  libssh-dev
  gettext
  cvs
  python-dev
  libyajl-dev
  libboost-thread-dev
  libplist-dev
  libusb-dev
  libudev-dev
  libtinyxml-dev
  libcap-dev
  curl
  swig
  default-jre
  libtiff-dev
}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

if node['platform_version'] >= "10.10"
    %w{
        autopoint
        libltdl-dev
    }.each do |pkg|
        package pkg do
            action :upgrade
        end
    end
end

if node["platform_version"] >= "12.10"
  package "libtag1-dev" do
    action :upgrade
  end
end


git "#{node['xbmc']['location']}/xbmc" do
  repository "git://github.com/xbmc/xbmc.git"
  reference "master"
  action :sync
end


bash "compile_xbmc_source" do
  cwd "#{node['xbmc']['location']}/xbmc"
  code <<-EOH
    ./bootstrap &&
    ./configure #{node['xbmc']['default_configure_flags'].join(" ")} &&
    make -j 2 &&
    make install
  EOH

    not_if do
        ::File.exists?("#{node['xbmc']['prefix']}/bin/xbmc") &&
        node['xbmc']['force_recompile'] == false
    end
end

template "/etc/init.d/xbmc" do
    source "xbmc.erb"
    mode 0645
end

directory  "/home/#{node['xbmc']['user']}/.xbmc/userdata" do
  owner node["xbmc"]["user"]
  group node["xbmc"]["group"]
  mode "0755"
  recursive true
  action :create
end

template "/home/#{node['xbmc']['user']}/.xbmc/userdata/advancedsettings.xml" do
    source "advancedsettings.xml.erb"
    mode "0644"
    owner node['xbmc']['user']
    group node['xbmc']['group']
end

template "/home/#{node['xbmc']['user']}/.xbmc/userdata/guisettings.xml" do
    source "guisettings.xml.erb"
    mode "0644"
    owner node['xbmc']['user']
    group node['xbmc']['group']
end
