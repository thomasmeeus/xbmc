default['xbmc']['prefix']   = "/usr/bin"
default['xbmc']['location']   = "/opt"
default['xbmc']['user']   = "xbmc"

default['xbmc']['default_configure_flags'] = [
   "--enable-vaapi",
   "--enable-libcec=yes",
   "--enable-avahi",
   "--enable-airplay",
   "--enable-airtunes",
]

default['xbmc']['configure_flags']  = Array.new
default['xbmc']['force_recompile']  = true
