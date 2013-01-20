default['xbmc']['prefix']   = "/usr/local"
default['xbmc']['location']   = "/opt"
default['xbmc']['user']   = "xbmc"
default['xbmc']['group']   = "xbmc"
default['xbmc']['default_configure_flags'] = Array.new
default['xbmc']['force_recompile']  = false

default["xbmc"]["loglevel"] = "0"
default["xbmc"]["algorithmdirtyregions"] = "1"
default["xbmc"]["visualizedirtyregions"] = "false"
default["xbmc"]["nofliptimeout"] = "1000"
default["xbmc"]["showexitbutton"] = "false"
default["xbmc"]["useddsfanart"] = "true"
default["xbmc"]["cputempcommand"] =""
default["xbmc"]["gputempcommand"] =""
default['xbmc']['enable_libshairport']  = "true"

default["xbmc"]["enablerssfeeds"] ="false"
default["xbmc"]["enablejoystick"] ="false"
default["xbmc"]["enablemouse"] ="false"
default["xbmc"]["remoteaskeyboard"] ="false"
default["xbmc"]["guisoundmode"] ="0"
default["xbmc"]["ac3passthrough"] ="true"
default["xbmc"]["dtshdpassthrough"] ="true"
default["xbmc"]["multichannellpcm"] ="true"
default["xbmc"]["passthroughaac"] ="true"
default["xbmc"]["truehdpassthrough"] ="true"
default["xbmc"]["subtitlelanguage"] ="dutch"
default["xbmc"]["normalizelevels"] = "false"


default['xbmc']['usemysql'] = false
default['mysql']['bind_address'] = "127.0.0.1"
default['mysql']['server_debian_password'] = "mystrongmysqlrootpassword"
default['mysql']['server_root_password']   = "mystrongmysqlrootpassword"
default['mysql']['server_repl_password']   = "mystrongmysqlrootpassword"
default['xbmc']['mysql']['username'] = "xbmc"
default['xbmc']['mysql']['password'] = "mystrongxbmcrootpassword"

default['xbmc']['videosources'] = [
                                              {   "name" => "TV-Shows",
                                                  "path" => "/media/TV-Shows/"
                                               },
                                              {   "name" => "Movies",
                                                  "path" => "/media/Movies/"
                                               }
                                      ]
